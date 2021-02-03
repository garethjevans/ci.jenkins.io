source:
  kind: dockerDigest
  spec:
    image: "jenkinsciinfra/jenkins-lts"
    tag: "latest"
targets:
  imageTag:
    name: "jenkinsciinfra/jenkins-lts custom image docker digest"
    kind: yaml
    spec:
      file: "config/default/ci-infra-io.yaml"
      key: "controller.tag"
