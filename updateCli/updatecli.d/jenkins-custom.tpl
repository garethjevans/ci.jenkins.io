source:
  kind: dockerDigest
  spec:
    image: "garethjevans/jenkins"
    tag: "latest"
targets:
  imageTag:
    name: "garethjevans/jenkins custom image docker digest"
    kind: yaml
    spec:
      file: "config/default/ci-infra-io.yaml"
      key: "controller.tag"
    scm:
      github:
        user: "{{ .github.user }}"
        email: "{{ .github.email }}"
        owner: "garethjevans"
        repository: "ci.jenkins.io"
        token: "{{ requiredEnv .github.token }}"
        username: "{{ .github.username }}"
        branch: "main"
