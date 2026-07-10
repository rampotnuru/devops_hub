#!/bin/bash

set -e

TOMCAT_VERSION="11.0.24"
TOMCAT_USER="tomcat"
TOMCAT_DIR="/opt/tomcat"

echo "========================================="
echo "Tomcat 11 Installation Started"
echo "========================================="

# Verify script is run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script using sudo."
    exit 1
fi

echo "Updating packages..."
yum update -y

echo "Installing Java 21..."
yum install java-21-amazon-corretto-devel -y

echo "Verifying Java installation..."
java --version

echo "Creating Tomcat user..."

if ! id "$TOMCAT_USER" >/dev/null 2>&1; then
    useradd -r -U -s /bin/false "$TOMCAT_USER"
fi

echo "Removing any previous Tomcat installation..."
rm -rf "$TOMCAT_DIR"

echo "Downloading Tomcat ${TOMCAT_VERSION}..."

cd /tmp

rm -f apache-tomcat-${TOMCAT_VERSION}.tar.gz

wget -O apache-tomcat-${TOMCAT_VERSION}.tar.gz \
https://downloads.apache.org/tomcat/tomcat-11/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz

echo "Verifying downloaded archive..."

if [ ! -f apache-tomcat-${TOMCAT_VERSION}.tar.gz ]; then
    echo "Tomcat download failed."
    exit 1
fi

echo "Creating installation directory..."
mkdir -p "$TOMCAT_DIR"

echo "Extracting Tomcat..."

tar -xzf apache-tomcat-${TOMCAT_VERSION}.tar.gz \
-C "$TOMCAT_DIR" \
--strip-components=1

echo "Validating extraction..."

if [ ! -d "$TOMCAT_DIR/bin" ]; then
    echo "ERROR: $TOMCAT_DIR/bin not found."
    exit 1
fi

if [ ! -f "$TOMCAT_DIR/bin/startup.sh" ]; then
    echo "ERROR: startup.sh not found."
    exit 1
fi

echo "Setting ownership..."

chown -R ${TOMCAT_USER}:${TOMCAT_USER} "$TOMCAT_DIR"

echo "Setting permissions..."

chmod +x "$TOMCAT_DIR"/bin/*.sh

echo "Creating systemd service file..."

cat > /etc/systemd/system/tomcat.service <<EOF
[Unit]
Description=Apache Tomcat 11 Web Application Container
After=network.target

[Service]
Type=forking

User=${TOMCAT_USER}
Group=${TOMCAT_USER}

Environment=JAVA_HOME=/usr/lib/jvm/java-21-amazon-corretto
Environment=CATALINA_PID=${TOMCAT_DIR}/temp/tomcat.pid
Environment=CATALINA_HOME=${TOMCAT_DIR}
Environment=CATALINA_BASE=${TOMCAT_DIR}

ExecStart=${TOMCAT_DIR}/bin/startup.sh
ExecStop=${TOMCAT_DIR}/bin/shutdown.sh

Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

echo "Reloading systemd..."

systemctl daemon-reload

echo "Enabling Tomcat service..."

systemctl enable tomcat

echo "Starting Tomcat service..."

systemctl start tomcat

echo "Waiting for Tomcat startup..."
sleep 10

echo "========================================="
echo "Tomcat Service Status"
echo "========================================="

systemctl status tomcat --no-pager

echo
echo "========================================="
echo "Tomcat Installation Completed"
echo "========================================="
echo

echo "Java Version:"
java --version

echo
echo "Tomcat Version:"
$TOMCAT_DIR/bin/version.sh

echo
echo "Check Port 8080:"
ss -tulpn | grep 8080 || true
