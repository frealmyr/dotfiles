alias k='kubectl $kns'

# k8s context
alias kccc='kubectl config current-context'
alias kcdc='kubectl config delete-context'
alias kcgs='kubectl config get-contexts'
alias kcuc='kubectl config use-context'
alias knsd='kubectl config set-context --current --namespace'

# k8s logs
alias kl='k logs'
alias kl1h='k logs --since 1h'
alias kl1m='k logs --since 1m'
alias kl1s='k logs --since 1s'
alias klf='k logs -f'
alias klf1h='k logs --since 1h -f'
alias klf1m='k logs --since 1m -f'
alias klf1s='k logs --since 1s -f'
alias ktail='stern $kns'

# k8s pod
alias kdp='k describe pods'
alias kep='k edit pods'
alias keti='k exec -ti'
alias kgp='k get pods'
alias kgpa='kubectl get pods --all-namespaces'
alias kgpw='kgp --watch'
alias kgpwide='kgp -o wide'
alias kpf="k port-forward --address 0.0.0.0"

# k8s service
alias kds='k describe svc'
alias kes='k edit svc'
alias kgs='k get svc'
alias kgsa='kubectl get svc --all-namespaces'
alias kgsw='kgs --watch'
alias kgswide='kgs -o wide'

# k8s ingress
alias kdi='k describe ingress'
alias kei='k edit ingress'
alias kgi='k get ingress'
alias kgia='kubectl get ingress --all-namespaces'

# k8s namespace
alias kdns='k describe namespace'
alias kens='k edit namespace'
alias kgns='k get namespaces'

# k8s configmap
alias kdcm='k describe configmap'
alias kecm='k edit configmap'
alias kgcm='k get configmaps'
alias kgcma='kubectl get configmaps --all-namespaces'

# k8s secret
alias kdsec='k describe secret'
alias kgsec='k get secret'
alias kgseca='kubectl get secret --all-namespaces'

# k8s deployment
alias kdd='k describe deployment'
alias kdeld='k delete deployment'
alias ked='k edit deployment'
alias kgd='k get deployment'
alias kgda='kubectl get deployment --all-namespaces'
alias kgdw='kgd --watch'
alias kgdwide='kgd -o wide'
alias krsd='k rollout status deployment'
alias ksd='k scale deployment'

# k8s statefulsets
alias kdelss='k delete statefulset'
alias kdss='k describe statefulset'
alias kess='k edit statefulset'
alias kgss='k get statefulset'
alias kgssa='kubectl get statefulset --all-namespaces'
alias kgssw='kgss --watch'
alias kgsswide='kgss -o wide'
alias krsss='k rollout status statefulset'
alias ksss='k scale statefulset'

# k8s node
alias kdno='k describe node'
alias keno='k edit node'
alias kgno='k get nodes'

# k8s persistentvolumeclaim
alias kdpvc='k describe pvc'
alias kepvc='k edit pvc'
alias kgpvc='k get pvc'
alias kgpvca='kubectl get pvc --all-namespaces'
alias kgpvcw='kgpvc --watch'

# k8s ksa
alias kdsa="k describe sa"
alias kgsa="k get sa"

# k8s daemonset
alias kdds='k describe daemonset'
alias keds='k edit daemonset'
alias kgds='k get daemonset'
alias kgdsw='kgds --watch'

# k8s cronjob
alias kdcj='k describe cronjob'
alias kecj='k edit cronjob'
alias kgcj='k get cronjob'
