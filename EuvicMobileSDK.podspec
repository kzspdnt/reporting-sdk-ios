Pod::Spec.new do |s|
    s.name = "EuvicMobileSDK"
    s.version = "0.1.0"
    s.summary = "A brief description of EuvicMobileSDK project."
    s.description = ""
    s.homepage = "https://github.com/Clickonometrics/reporting-sdk-ios"
    s.license = { :type => 'Apache License 2.0', :file => 'LICENSE' }
    s.author = { 'Kamil Modzelewski' => 'kmodzelewski@speednet.pl' }
    s.source = { :git => "https://github.com/Clickonometrics/reporting-sdk-ios.git", :tag => "#{s.version}" }
    s.vendored_frameworks = "./Framework/EuvicMobileSDK.xcframework"
    s.platform =  :ios, "13.0"
    s.swift_version = "5.7"
    s.ios.deployment_target = '13.0'
end