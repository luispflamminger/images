ARG VERSION=latest
FROM jellyfin/jellyfin:${VERSION}

RUN <<EOF
apt update
apt install -y \
    curl \
    gpg
mkdir -p /etc/apt/keyrings
curl -fsSL https://repo.radeon.com/rocm/rocm.gpg.key | gpg --dearmor -o /etc/apt/keyrings/rocm.gpg
echo "Types: deb \n\
URIs: https://repo.radeon.com/rocm/apt/latest \n\
Suites: ubuntu \n\
Components: main \n\
Architectures: amd64 \n\
Signed-By: /etc/apt/keyrings/rocm.gpg" | tee /etc/apt/sources.list.d/rocm.sources
apt install -y rocm-opencl-runtime

apt remove -y \
    curl \
    gpg
rm -rf /var/lib/apt/lists/*
rm /etc/apt/sources.list.d/rocm.sources
rm /etc/apt/keyrings/rocm.gpg
EOF

LABEL org.opencontainers.image.source="https://github.com/jellyfin/jellyfin"
