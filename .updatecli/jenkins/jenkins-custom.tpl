title: Bump jenkins custom image
sources:
  default:
    kind: githubrelease
    spec:
      name: Get garethjevans/jenkins latest version
      owner: garethjevans
      repository: jenkins-image
      token: "{{ requiredEnv .github.token }}"
      username: "{{ .github.username }}"
conditions:
  docker-image:
    name: Ensure that the image "garethjevans/jenkins:<found_version>" is published on the DockerHub
    kind: dockerimage
    spec:
      image: garethjevans/jenkins    
targets:
  image-tag:
    name: garethjevans/jenkins custom image docker digest
    kind: yaml
    spec:
      file: config/default/ci-infra-io.yaml
      key: controller.tag
