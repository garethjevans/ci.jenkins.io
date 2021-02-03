source:
  kind: dockerDigest
  spec:
    image: "jenkinsciinfra/jenkins-weekly"
    tag: "latest"
targets:
  imageTag:
    name: "jenkinsciinfra/jenkins-weekly custom image docker digest"
    kind: yaml
    spec:
      file: "config/default/ci-infra-io.yaml"
      key: "controller.tag"
