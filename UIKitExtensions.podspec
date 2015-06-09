Pod::Spec.new do |s|
  s.name         = "UIKitExtensions"
  s.version      = "1.0.1"
  s.summary      = "Some Extensions Categories for UIKit"                   
  s.homepage     = "https://github.com/Tinghui/UIKitExtensions"
  s.license      = 'MIT'
  s.author       = { 'Tinghui' => 'tinghui.zhang3@gmail.com' }
  s.platform     = :ios, '7.0'
  s.source       = { :git => "https://github.com/Tinghui/UIKitExtensions.git", :tag => "1.0.1" }
  s.requires_arc = true
  s.source_files = 'UIKitExtensions/*.{h,m}'
  s.framework    = 'UIKit', 'QuartzCore'
end
