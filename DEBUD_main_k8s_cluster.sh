# comprehensive script that will monitor the top 10 operational issues in Kubernetes clusters.
# This script is designed to monitor and report issues like resource management, networking challenges, pod failures, and more

==============================================================================
# How to use the script
# Instructions:
# 1. Save the script: Save the script as k8s_monitor.sh

# 2. Make it executable: Run chmod +x k8s_monitor.sh to make the script executable.

# 3. Run the script: Use sudo ./k8s_monitor.sh to run it with root privileges.

# 4. Stop the script: Press [CTRL+C] to stop the monitoring.
================================================================================

#!/bin/bash

# Check if script is run as root, otherwise inform the user
if [ "$(id -u)" -ne 0 ]; then
    echo "This script should be run as root for complete system monitoring."
    exit 1
fi

# Function to check resource management (resource requests/limits)
check_resource_management() {
    echo "Checking resource utilization..."
    kubectl top nodes
    kubectl top pods --all-namespaces
    echo ""
}

# Function to check networking issues (check pod network)
check_networking() {
    echo "Checking pod networking..."
    kubectl get pods --all-namespaces -o wide | grep -i 'not ready'
    echo ""
}

# Function to check cluster scaling (node and pod scaling)
check_cluster_scaling() {
    echo "Checking cluster scaling..."
    kubectl get nodes
    kubectl get deployment --all-namespaces | grep 'replicas'
    echo ""
}

# Function to check security vulnerabilities (RBAC rules, pod security)
check_security() {
    echo "Checking security configuration..."
    kubectl get roles --all-namespaces
    kubectl get podsecuritypolicies
    echo ""
}

# Function to check pod failures (crash loops, pod status)
check_pod_failures() {
    echo "Checking pod failures..."
    kubectl get pods --all-namespaces | grep -E 'CrashLoopBackOff|Error'
    echo ""
}

# Function to check storage management (persistent volume status)
check_storage_management() {
    echo "Checking persistent storage..."
    kubectl get pv
    kubectl get pvc --all-namespaces
    echo ""
}

# Function to check node failures (node status)
check_node_failures() {
    echo "Checking node failures..."
    kubectl get nodes | grep -i 'NotReady'
    echo ""
}

# Function to check control plane overload (API server health)
check_control_plane() {
    echo "Checking control plane status..."
    kubectl get componentstatuses
    echo ""
}

# Function to check logging and monitoring (missing logs, missing metrics)
check_logging_monitoring() {
    echo "Checking logging and monitoring..."
    kubectl get pods --all-namespaces | grep -i 'fluentd|prometheus'
    echo ""
}

# Function to check configuration drift (compare environments)
check_configuration_drift() {
    echo "Checking for configuration drift..."
    kubectl diff -f /path/to/your/deployment.yaml
    echo ""
}

# Display instructions
echo "Kubernetes Cluster Health Monitoring Script"
echo "Press [CTRL+C] to stop the monitoring."
echo "-----------------------------------------"
echo ""

# Continuous monitoring loop
while true; do
    check_resource_management
    check_networking
    check_cluster_scaling
    check_security
    check_pod_failures
    check_storage_management
    check_node_failures
    check_control_plane
    check_logging_monitoring
    check_configuration_drift
    sleep 10
done
