Pod::Spec.new do |s|
  s.name         = "CZStatusView"
  s.version      = "0.0.1"
  s.summary      = "iOS-状态视图"
  s.description  = "iOS-状态视图类"
  s.homepage     = "https://github.com/chenzhe555/iOS-CZStatusView"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "chenzhe555" => "376811578@qq.com" }
  s.ios.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/chenzhe555/iOS-CZStatusView.git", :tag => "#{s.version}" }
  s.subspec 'CZStatusView' do |one|
      one.source_files = 'CZStatusView/classes/*.{h,m}'
  end
  # s.frameworks = "SomeFramework", "AnotherFramework"
  # s.libraries = "iconv", "xml2"
  s.requires_arc = true
  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  s.dependency "SDWebImage", "~> 5.0.0-beta3"
end