docker build -t registry.gitlab.com/yjkim_ntels/kubernetes-stress-test/sample .
docker build -t registry.gitlab.com/yjkim_ntels/kubernetes-stress-test/nbase .

docker push registry.gitlab.com/yjkim_ntels/kubernetes-stress-test/sample
docker push registry.gitlab.com/yjkim_ntels/kubernetes-stress-test/nbase

registry.gitlab.com/yjkim_ntels/kubernetes-stress-test/nbase:latest
registry.gitlab.com/yjkim_ntels/kubernetes-stress-test/sample:latest
