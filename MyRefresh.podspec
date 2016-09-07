
Pod::Spec.new do |s|
s.name         = "MyRefresh"
s.version      = "0.0.2"
s.summary      = "一个刷新的简单demo."
s.homepage     = "https://github.com/1095033639/MyRefresh"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.author       = { "sdscx" => "1095033639@qq.com" }
s.platform     = :ios, "6.0"
s.source       = { :git => "https://github.com/1095033639/MyRefresh.git", :tag => "0.0.2"}
s.source_files  = "MyRefresh/MyRefresh/*.{h,m}"
s.requires_arc = true


end