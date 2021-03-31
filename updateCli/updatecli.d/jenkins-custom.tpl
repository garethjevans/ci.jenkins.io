title: Bump jenkins-weekly custom image
pipelineID: bumpjenkinsweekly
sources:
  default:
    kind: githubRelease
    spec:
      name: Get jenkins-infra/docker-jenkins-weekly latest version
      owner: "jenkins-infra"
      repository: "docker-jenkins-weekly"
      token: "{{ requiredEnv .github.token }}"
      username: "{{ .github.username }}"
      versionFilter:
        pattern: ~0
        kind: semver
  targets:
    imageTag:
      name: "jenkinsciinfra/jenkins-weekly custom image docker digest"
      kind: yaml
      spec:
        file: "config/default/ci-infra-io.yaml"
        key: "controller.tag"
