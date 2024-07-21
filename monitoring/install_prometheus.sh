#!/bin/bash

# Define Prometheus version
PROMETHEUS_VERSION="2.53.1"
PROMETHEUS_ARCH="linux-amd64"

# Download Prometheus
echo "Downloading Prometheus..."
wget https://github.com/prometheus/prometheus/releases/download/v${PROMETHEUS_VERSION}/prometheus-${PROMETHEUS_VERSION}.${PROMETHEUS_ARCH}.tar.gz

# Extract the tarball
echo "Extracting Prometheus..."
tar xvf prometheus-${PROMETHEUS_VERSION}.${PROMETHEUS_ARCH}.tar.gz

# Move Prometheus to a proper location
echo "Moving Prometheus to /opt..."
sudo mv prometheus-${PROMETHEUS_VERSION}.${PROMETHEUS_ARCH} /opt/prometheus

# Copy the prometheus.yaml configuration file
echo "Copying prometheus.yaml configuration..."
sudo cp prometheus.yaml /opt/prometheus/prometheus.yml

# Cleanup downloaded tarball
echo "Cleaning up..."
rm prometheus-${PROMETHEUS_VERSION}.${PROMETHEUS_ARCH}.tar.gz

# Run Prometheus
echo "Starting Prometheus..."
nohup /opt/prometheus/prometheus --config.file=/opt/prometheus/prometheus.yml > /dev/null 2>&1 &

echo "Prometheus has been started."