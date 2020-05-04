

Pod::Spec.new do |spec|

  spec.name         = "XXXTool"
  spec.version      = "0.0.1"
  spec.summary      = "XWF is very handsome"
  spec.homepage     = "https://github.com/xuwenfeng520/XXXTool"
  spec.license      = "MIT"
  # spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  spec.author             = { "xuwenfeng520" => "ixwf@163.com" }
  spec.social_media_url   = "https://github.com/xuwenfeng520"
  spec.platform     = :ios, "9.0"

#  spec.source       = { :git => "https://github.com/xuwenfeng520/XXXTool.git", :tag => spec.version }
  spec.source       = { :git => "", :tag => spec.version }
  

  spec.requires_arc = true

#spec.source_files  = "XXXTool"
spec.source_files  = "XXXTool/Classes/**/*"
#spec.source_files  = "XXXTool","XXXTool/Classes/**/*"


  spec.dependency 'AFNetworking'


end
