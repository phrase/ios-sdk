Pod::Spec.new do |s|
  s.name                = "PhraseApp"
  s.version             = "0.1.0"
  s.summary             = "iOS SDK for PhraseApp"
  s.homepage            = "https://phraseapp.com"
  s.license             = { :type => 'Commercial', :file => 'LICENSE' }
  s.author              = { "Dynport GmbH" => "support@phraseapp.com" }
  s.source              = { :git => "https://github.com/phrase/sdk-ios.git", :tag => "0.1.0" }
  s.platform            = :ios, '11.4'
  s.frameworks          = 'Foundation'
  s.preserve_paths      = 'PhraseApp.framework'
  s.public_header_files = 'PhraseApp.framework/Headers/PhraseApp.h'
  s.source_files        = 'PhraseApp.framework/Headers/PhraseApp.h'
  s.vendored_frameworks = 'PhraseApp.framework'
  s.requires_arc        = true
end
