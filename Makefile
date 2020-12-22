CHART := jenkins

build:
		helmfile sync

diff:
		helmfile diff

deploy: build
		helmfile apply

test:
		helmfile test
		kubectl get pods | grep Completed | awk '{print $$1}' | xargs kubectl delete pod

delete:
		helmfile destroy

lint:
		yamllint --config-file yamllint.config helmfile.d config .github
