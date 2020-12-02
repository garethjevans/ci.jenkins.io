CHART := cijenkinsio

build:
		rm $(CHART)/Chart.lock
		helm dependency build $(CHART)

diff:
		helm diff upgrade --reset-values --show-secrets --allow-unreleased $(CHART) $(CHART)

deploy: build
		helm upgrade --install $(CHART) $(CHART)

test:
		helm test $(CHART)
		kubectl logs $(CHART)-test-connection

delete:
		helm uninstall $(CHART)

