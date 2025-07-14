🟢 Cluster Overview

1. Pod Count (Running / Total)

count(kube_pod_status_phase{phase="Running"}) 
/
count(kube_pod_status_phase)

2. Node Count

count(kube_node_info)

3. Cluster CPU Usage %

sum(rate(container_cpu_usage_seconds_total{job="kubelet", image!=""}[5m])) 
/ 
sum(machine_cpu_cores)

4. Cluster Memory Usage %

sum(container_memory_working_set_bytes{job="kubelet", image!=""}) 
/
sum(machine_memory_bytes)

🟡 Node Health Panels

Node CPU Usage by Node

instance:node_cpu_utilisation:rate5m

Node Memory Usage

100 * (1 - (node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes))

Node Conditions (Ready Status)

kube_node_status_condition{condition="Ready", status="true"}

🔴 Pod/Deployment Health

CrashLoopBackOffs

kube_pod_container_status_waiting_reason{reason="CrashLoopBackOff"}

Pods Not Ready

kube_pod_status_ready{condition="true"} == 0

Top Failing Pods by Restarts

topk(5, increase(kube_pod_container_status_restarts_total[1h]))

Deployment Replica Mismatch

kube_deployment_spec_replicas - kube_deployment_status_replicas_available

📈 Resource Usage by Namespace or Pod

Top CPU-Consuming Pods

topk(5, rate(container_cpu_usage_seconds_total{image!=""}[5m]))

Top Memory-Consuming Pods

topk(5, container_memory_working_set_bytes{image!=""})

CPU Usage by Namespace

sum(rate(container_cpu_usage_seconds_total{image!=""}[5m])) by (namespace)

🧾 Optional: Kubernetes Events via Logs

If you have Azure Monitor or Loki set up for logs:

    Create a Logs panel using the Azure Monitor > Logs source and query for KubePodInventory, KubeEvents, or ContainerLog.




1. Cluster Overview (Top Row)

A snapshot view for fast triage.

Panel	Type	Metrics/Source	Notes
Cluster Uptime	Stat	up from node_exporter	Confirms all nodes are online
Node Count	Stat	count(kube_node_info)	Total nodes
Pod Count (Running/Total)	Stat	count(kube_pod_status_phase)	Use filters: phase="Running" vs all
CPU Usage %	Gauge	sum(rate(container_cpu_usage_seconds_total)) / allocatable	Total vs allocated
Memory Usage %	Gauge	sum(container_memory_working_set_bytes) / allocatable	From kubelet or cAdvisor


2. Node Health

Performance and issues per node.

Panel	Type	Metrics/Source	Notes

Node CPU Usage (%)	Bar Chart	instance:node_cpu_utilisation:rate5m	Breakdown by $node
Node Memory Usage (%)	Bar Chart	node_memory_Active_bytes / MemTotal	Show alerts if over threshold (e.g. 90%)
Node Conditions	Table	kube_node_status_condition	Show Ready, DiskPressure, etc.
Node Disk Space % Used	Bar Chart	node_filesystem_usage / node_filesystem_size	Exclude /tmpfs


3. Pod and Deployment Health

Track pod status, restarts, and deployment anomalies.

Panel	Type	Metrics/Source	Notes
Top Failing Pods	Table	kube_pod_container_status_restarts_total	Sort by restarts desc
CrashLoopBackOffs	Table	kube_pod_container_status_waiting_reason	Filter for reason="CrashLoopBackOff"
Pods Not Ready	Table	kube_pod_status_ready{condition="false"}	Add pod name, namespace, and node
Deployment Replica Mismatch	Table	kube_deployment_status_replicas_available != kube_deployment_spec_replicas	Detect rollout failures


4. Workload Resource Usage

Helps developers track usage per namespace/deployment.

Panel	Type	Metrics/Source	Notes
Top CPU-Consuming Pods	Table	rate(container_cpu_usage_seconds_total)	Sort by CPU usage
Top Memory-Consuming Pods	Table	container_memory_working_set_bytes	Sort by usage
Namespace Resource Usage	Pie or Bar	Grouped container_memory/cpu by $namespace	Useful to find resource-hungry teams


5. Events & Alerts (Optional but Powerful)

Add recent events or Prometheus/Grafana alerts.

Panel	Type	Metrics/Source	Notes
Kubernetes Events	Logs	via loki, elasticsearch, or fluentd	Surface Warning or Failed events
Active Alerts	Table	ALERTS{alertstate="firing"}	From Prometheus Alertmanager or Grafana
