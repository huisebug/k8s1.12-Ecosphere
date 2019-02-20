cd /etc/kubernetes
export KUBE_APISERVER="https://192.168.137.13:9443"
# 设置集群参数
kubectl config set-cluster kubernetes \
--certificate-authority=/etc/kubernetes/ssl/ca.pem \
--embed-certs=true \
--server=${KUBE_APISERVER} \
--kubeconfig=kube-scheduler.kubeconfig
# 设置客户端认证参数
kubectl config set-credentials system:kube-scheduler \
--client-certificate=/etc/kubernetes/ssl/kube-scheduler.pem \
--client-key=/etc/kubernetes/ssl/kube-scheduler-key.pem \
--embed-certs=true \
--kubeconfig=kube-scheduler.kubeconfig
# 设置上下文参数
kubectl config set-context system:kube-scheduler@kubernetes \
--cluster=kubernetes \
--user=system:kube-scheduler \
--kubeconfig=kube-scheduler.kubeconfig
# 设置默认上下文
kubectl config use-context system:kube-scheduler@kubernetes --kubeconfig=kube-scheduler.kubeconfig


