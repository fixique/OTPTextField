Pod::Spec.new do |s|

  s.name = "SFOTPTextField"
  s.version = "1.1.0"
  s.summary = "This library makes it easy to implement SMS input field with the ability to automatically substitute code from SMS messages"
  s.homepage = "https://github.com/fixique/OTPTextField"
  s.license = { :type => "MIT", :file => "LICENSE" }

  s.author = { "Krupenko Vliadislav" => "dev.fixique@gmail.com" }
  s.ios.deployment_target = "11.0"
  s.swift_version = '5.0'

  s.source = { :git => "https://github.com/fixique/OTPTextField.git", :tag => "#{s.version}" }
  s.source_files = 'OTPTextField/**/*.{swift,xib}'


  s.framework  = "UIKit"

end
