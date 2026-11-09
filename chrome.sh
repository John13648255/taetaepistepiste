
#!/bin/bash
set -eu

echo "================================"
echo "   GOOGLE CHROME INSTALLER"
echo "================================"

# Check if Chrome is already installed
if command -v google-chrome >/dev/null 2>&1; then
    echo "Chrome is already installed!"
    google-chrome --version
    exit 0
fi

echo "[1/4] Downloading Google Chrome..."

wget -O /tmp/google-chrome-stable.deb \
https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

echo "[2/4] Updating package lists..."
sudo apt-get update

echo "[3/4] Installing Google Chrome..."
sudo apt-get install -y /tmp/google-chrome-stable.deb

echo "[4/4] Verifying installation..."

hash -r

if command -v google-chrome >/dev/null 2>&1; then
    google-chrome --version
    echo "Chrome installation successful!"
else
    echo "ERROR: Chrome installation failed."
    exit 1
fi

echo "================================"
echo "Installation completed!"
echo "================================"

echo "To launch Chrome, use:"
echo "google-chrome --no-sandbox --disable-dev-shm-usage"
