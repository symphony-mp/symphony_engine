.PHONY: upgrade

upgrade:
	@echo "Upgrading dependencies..."
	@fvm flutter clean
	@fvm flutter pub get
	@fvm flutter pub upgrade
	@fvm flutter pub upgrade --major-versions
