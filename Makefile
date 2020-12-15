CHART := cijenkinsio

build:
		rm $(CHART)/Chart.lock
		helm dependency build $(CHART)
		helm lint $(CHART)

diff:
		helm diff upgrade --reset-values --show-secrets --allow-unreleased $(CHART) $(CHART)

deploy: build
		helm upgrade --install $(CHART) $(CHART)

test:
		helm test $(CHART)
		kubectl logs $(CHART)-test-connection
		kubectl logs $(CHART)-test-login
		kubectl logs $(CHART)-test-plugins
		kubectl get pods | grep Completed | awk '{print $$1}' | xargs kubectl delete pod

delete:
		helm uninstall $(CHART)

