.PHONY: runner upgrade

runner:
	@echo "Running the build_runner..."
	@fvm dart run build_runner build

upgrade:
	@echo "Upgrading dependencies..."
	@fvm flutter clean
	@fvm flutter pub get
	@fvm flutter pub upgrade
	@fvm flutter pub upgrade --major-versions
