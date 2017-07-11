Pod::Spec.new do |s|
  s.name        = "OpenMensaKit"
  s.version     = "0.1.0"
  s.summary     = "Query OpenMensa for canteen and meal data"
  s.description = <<-DESC
    Query the OpenMensa API for canteen and meal data.
  DESC

  s.homepage         = "https://github.com/kiliankoe/OpenMensaKit"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "Kilian Koeltzsch" => "me@kilian.io" }
  s.social_media_url = "https://twitter.com/kiliankoe"

  s.ios.deployment_target     = "8.0"
  s.osx.deployment_target     = "10.9"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target    = "9.0"

  s.source       = { :git => "https://github.com/kiliankoe/OpenMensaKit.git", :tag => s.version.to_s }
  s.source_files = "Sources/**/*"
  s.frameworks   = "Foundation"
end
