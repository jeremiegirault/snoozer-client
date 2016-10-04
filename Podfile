# Uncomment this line to define a global platform for your project
# platform :ios, '9.0'

install! 'cocoapods', :deterministic_uuids => false

target 'snoozer' do
  use_frameworks!

  pod 'SnoozerRPC', :path => '.'
  pod 'OAuthSwift', :git => 'https://github.com/OAuthSwift/OAuthSwift.git', :branch => 'master'
  pod 'SnapKit', '~> 3.0'
  pod 'MGSwipeTableCell'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
