module k8s-crd-samp

go 1.15

require (
	github.com/seecsea/k8s-crd-samp v0.0.0-00010101000000-000000000000 // indirect
	k8s.io/api v0.17.0
	k8s.io/apimachinery v0.17.0
	k8s.io/client-go v0.17.0
)

replace github.com/seecsea/k8s-crd-samp => ../k8s-crd-samp
