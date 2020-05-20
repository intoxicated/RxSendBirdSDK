Pod::Spec.new do |s|
    s.name             = 'RxSendBirdSDK'
    s.version          = '0.1.0'
    s.summary          = 'RxSwift extensions for SendBirdSDK'
    
    # This description is used to generate tags and improve search results.
    #   * Think: What does it do? Why did you write it? What is the focus?
    #   * Try to keep it short, snappy and to the point.
    #   * Write the description between the DESC delimiters below.
    #   * Finally, don't worry about the indent, CocoaPods strips it!
    
    s.description      = <<-DESC
    RxSwift extensions for SendBirdSDK.
    DESC
    
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Woo' => 'yakle1218@gmail.com' }
    s.source           = { :git => 'https://github.com/intoxicated/RxSendBirdSDK.git', :tag => s.version.to_s }
    
    s.cocoapods_version = '>= 1.4.0'
    s.ios.deployment_target = '10.0'
    s.osx.deployment_target = '10.11'
    s.tvos.deployment_target = '10.0'

    s.static_framework = true
    s.dependency 'RxSwift', '~> 5'
    s.dependency 'RxCocoa', '~> 5'
    s.dependency 'SendBirdSDK', '~> 3'
    s.source_files = 'Sources/**/*'
end
