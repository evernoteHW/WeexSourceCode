#
#  Be sure to run `pod spec lint WeexSDK.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "WeexSDK"
  s.version      = "0.0.1"
  s.summary      = "A short description of WeexSDK."
  s.description  = <<-DESC
                  A framework for building Mobile cross-platform UI
                   DESC
  s.homepage     = "http://"
  s.license = {
    :type => 'Copyright',
    :text => <<-LICENSE
           WeiHu-INC copyright
    LICENSE
  }

  s.platform     = :ios
  s.ios.deployment_target = '8.0'
  s.source =  { :path => '.' }

  s.author             = { "WeiHu" => "7430328@qq.com" }
  s.source =  { :path => '.' }

  s.source_files = 'sdk/WeexSDK/Sources/**/*.{h,m,mm,c}'
  s.resources = 'sdk/WeexSDK/Resources/native-bundle-main.js', 'sdk/WeexSDK/Resources/wx_load_error@3x.png'

  s.user_target_xcconfig  = { 'FRAMEWORK_SEARCH_PATHS' => "'$(PODS_ROOT)/WeexSDK'" }
  s.requires_arc = true
  s.prefix_header_file = 'sdk/WeexSDK/Sources/Supporting Files/WeexSDK-Prefix.pch'
  s.xcconfig = { "OTHER_LINK_FLAG" => '$(inherited) -ObjC'}
  s.frameworks = 'CoreMedia','MediaPlayer','AVFoundation','AVKit','JavaScriptCore', 'GLKit'
  s.dependency 'SocketRocket'
  s.libraries = "stdc++"

end
