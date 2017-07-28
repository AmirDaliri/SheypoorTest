source "https://github.com/CocoaPods/Specs"
platform :ios, '8.0'
use_frameworks!


def shared_pods
  pod 'AlamofireImage'
  pod 'Alamofire'
  pod 'XCGLogger'
  pod 'SwiftyJSON'
  pod 'MBProgressHUD', '~> 0.9.0'
end

target 'SheypoorTest' do
  shared_pods
end

post_install do |installer|
	installer.pods_project.targets.each do |target|
		target.build_configurations.each do |config|
			config.build_settings['SWIFT_VERSION'] = '3.0'
		end
	end
end
