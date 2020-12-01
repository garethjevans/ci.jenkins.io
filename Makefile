CHART := cijenkinsio

init:
		curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
		chmod 700 get_helm.sh
		./get_helm.sh

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

