platform :ios, '11.0'

def utils
  pod 'SwiftLint', '0.30.1'
end

def common_pods
  utils
  pod 'SurfUtils/XibView', :git => 'https://github.com/surfstudio/iOS-Utils.git', :tag => '10.0.5'
end

target 'OTPTextField' do
  use_frameworks!
  common_pods

  target 'OTPTextFieldTests' do
    inherit! :search_paths
    common_pods
  end
end
