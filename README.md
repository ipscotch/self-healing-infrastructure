# Self-Healing Infrastructure Project

This project demonstrates a self-healing infrastructure setup using virtualization (Vagrant and VirtualBox), monitoring (Prometheus and Node Exporter), and orchestration (Kubernetes).


## Getting Started

### Prerequisites

- [VirtualBox](https://www.virtualbox.org/)
- [Vagrant](https://www.vagrantup.com/)
- [Prometheus](https://prometheus.io/download/)
- [Minikube](https://minikube.sigs.k8s.io/docs/start/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)

### Setting Up the Virtual Environment

1. **Clone the repository**:
   ```sh
   git clone https://github.com/yourusername/self-healing-infrastructure.git
   cd self-healing-infrastructure
   ```
2. **Start the VMs using Vagrant**:
   ```sh
   vagrant up
   ```

### Setting Up Monitoring

1. **Install Prometheus**:
   ```sh
   cd monitoring
   ./install_prometheus.sh
   ```

2. **Configure Prometheus to Monitor the VMs**:
   - Before starting Prometheus, you need to configure it to monitor your virtual machines. Open the `prometheus.yaml` file located in the `monitoring` directory.
   - Find the `scrape_configs` section and replace `<web_vm_ip>` and `<db_vm_ip>` with the actual IP addresses of your web and database VMs, respectively. The section should look something like this:
     ```yaml
     global:
       scrape_interval: 15s
     scrape_configs:
       - job_name: 'node_exporter'
         static_configs:
           - targets: ['192.168.1.2:9100', '192.168.1.3:9100']
     ```
     Replace `192.168.1.2` and `192.168.1.3` with the IP addresses of your web and database VMs.

3.  **Install Node Exporter on VMs**:
    ```sh
    cd monitoring
    ./install_node_exporter.sh
    ```

### Self-Healing Script

1. **Make the recovery script executable**:
   ```sh
   chmod +x scripts/vm_recovery.sh
   ```
2. **Schedule the script using cron**:
    ```sh
    crontab -e
    # Add the following line to run the script every minute
    * * * * * /path/to/scripts/vm_recovery.sh
    ```

### Setting Up Kubernetes
1. **Start Minikube and deploy the application**:
    ```sh
    cd k8s
    ./minikube_setup.sh
    kubectl apply -f nginx-deployment.yml
    ```
