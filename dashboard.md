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
