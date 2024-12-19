run:
	@fvm flutter run

clean:
	@- find . -type f -name *.g.dart -exec rm {} +
	@fvm flutter clean

resolve:
	@fvm flutter pub get

upgrade:
	@fvm flutter pub upgrade

generated:
	@fvm flutter packages pub run build_runner build --delete-conflicting-outputs

watch:
	@fvm flutter packages pub run build_runner watch --delete-conflicting-outputs

analyze:
	@fvm flutter analyze