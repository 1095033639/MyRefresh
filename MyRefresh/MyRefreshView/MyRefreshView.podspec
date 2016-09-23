

Pod::Spec.new do |s|
  s.name         = "MyRefreshView"
  s.version      = "0.0.1"
  s.summary      = "支持上拉下拉刷新通过动画显示."
  s.homepage     = "https://github.com/1095033639/MyRefreshView"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "sdscx" => "1095033639@qq.com" }
  s.platform     = :ios, "6.0"
   s.source   = { :https://github.com/1095033639/MyRefreshView.git
", :tag => "0.0.1" }
  s.source_files  = "MyRefresh/MyRefresh/MyRefreshView/*.{h,m}"
  s.requires_arc = true
end
