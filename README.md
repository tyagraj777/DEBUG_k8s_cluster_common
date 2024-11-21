Deatil Instructions:

1. Save the script: Save the script as k8s_monitor.sh.
2. Make it executable: Run chmod +x k8s_monitor.sh to make the script executable.
3. Run the script: Use sudo ./k8s_monitor.sh to run it with root privileges.
4. Stop the script: Press [CTRL+C] to stop the monitoring.

5. Explanation:
   
  a. Resource Management: Uses kubectl top to monitor resource usage.
  
  b. Networking: Checks pod readiness and networking status.
  
  c. Cluster Scaling: Verifies node and pod scaling configurations.
  
  d. Security: Checks RBAC roles and Pod Security Policies.
  
  e. Pod Failures: Detects pods in CrashLoopBackOff or Error states.
  
  f. Storage Management: Monitors Persistent Volume (PV) and Persistent Volume Claim (PVC) statuses.
  
  f. Node Failures: Flags nodes in NotReady state.
  
  g. Control Plane: Checks health of API components.
  
  h. Logging & Monitoring: Verifies logging and monitoring pods.
  
  i. Configuration Drift: Detects configuration changes by comparing YAML files.

  

  
This script will monitor and display the status of all these issues and help in identifying problems with Kubernetes clusters.
