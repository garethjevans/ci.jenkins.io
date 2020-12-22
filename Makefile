CHART := jenkins

build:
		helmfile sync

diff:
		helmfile diff

deploy: build
		helmfile apply

test:
		helm test $(CHART)
		kubectl logs $(CHART)-test-connection
		kubectl logs $(CHART)-test-login
		kubectl logs $(CHART)-test-plugins
		kubectl get pods | grep Completed | awk '{print $$1}' | xargs kubectl delete pod

delete:
		helmfile destroy

lint:
		yamllint --config-file yamllint.config helmfile.d config
