platform :ios, '11.0'

def utils
  pod 'SwiftLint', '0.30.1'
end

def common_pods
  utils
end

target 'OTPTextField' do
  use_frameworks!
  common_pods

  target 'OTPTextFieldTests' do
    inherit! :search_paths
    common_pods
  end
end
