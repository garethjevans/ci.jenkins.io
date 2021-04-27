title: Bump jenkins custom image
pipelineID: bumpjenkinsweekly
sources:
  default:
    kind: githubRelease
    spec:
      name: Get garethjevans/jenkins latest version
      owner: "garethjevans"
      repository: "jenkins-image"
      token: "{{ requiredEnv .github.token }}"
      username: "{{ .github.username }}"
conditions:
  dockerImage:
    name: Ensure that the image "garethjevans/jenkins:<found_version>" is published on the DockerHub
    kind: dockerImage
    spec:
      image: "garethjevans/jenkins"    
targets:
  imageTag:
    name: "garethjevans/jenkins custom image docker digest"
    kind: yaml
    spec:
      file: "config/default/ci-infra-io.yaml"
      key: "controller.tag"
