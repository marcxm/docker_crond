pipeline {
  agent {
    kubernetes {
      yaml """
apiVersion: v1
kind: Pod
metadata:
  labels:
    jenkins: worker
spec:
  containers:
  - name: kaniko
    image: gcr.io/kaniko-project/executor:debug
    command: ["/busybox/cat"]
    tty: true
    volumeMounts:
      - name: kaniko-secret
        mountPath: /kaniko/.docker/
  volumes:
    - name: kaniko-secret
      secret:
        secretName: regcred-dockerhub
        items:
          - key: .dockerconfigjson
            path: config.json
"""
    }
  }
  stages {
    stage('Stage 1: Build with Kaniko') {
      steps {
        container('kaniko') {
          sh '/kaniko/executor --context=https://github.com/marcxm/docker_crond.git \
                  --context `pwd`/ \
                  --destination=marcxms/crond:latest \
                  --insecure \
                  --skip-tls-verify \
                  --force \
                  --build-arg opts='GOARCH=amd64' \
                  --build-arg opts='GOARCH=arm64' \
                  --customPlatform=linux/arm64/v8 \
                  --customPlatform=linux/amd64 \
                  -v=debug
        }
      }
    }

  }
}
