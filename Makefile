## Initialization of the working environment.
init:
	# Install bundler if not installed
	if ! gem spec bundler > /dev/null 2>&1; then\
  		echo "bundler gem is not installed!";\
  		-sudo gem install bundler;\
	fi
	-bundle install --path .bundle
	-bundle exec pod repo update
	-bundle exec pod install

## Allows you to perfrom swiftlint lint command.
lint:
	./Pods/SwiftLint/swiftlint lint --config .swiftlint.yml

## Allows you to perfrom swiftlint autocorrect command.
format:
	./Pods/SwiftLint/swiftlint autocorrect --config .swiftlint.yml

## Allows you to perform pod install command via bundler settings. Use it instead plain pod install command.
pod:
	bundle exec pod install