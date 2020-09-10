Pod::Spec.new do |s|
  s.name                = "PhraseSDK"
  s.version             = "2.3.1"
  s.summary             = "iOS SDK for Phrase"
  s.homepage            = "https://phrase.com"
  s.license             = { :type => 'Commercial', :file => 'LICENSE.md' }
  s.author              = { "Dynport GmbH" => "support@phrase.com" }
  s.source              = { :git => "https://github.com/phrase/ios-sdk.git", :tag => "2.3.1" }
  s.platform            = :ios, '9.0'
  s.frameworks          = 'Foundation'
  s.preserve_paths      = 'PhraseSDK.framework'
  s.public_header_files = 'PhraseSDK.framework/Headers/PhraseSDK.h'
  s.source_files        = 'PhraseSDK.framework/Headers/PhraseSDK.h'
  s.vendored_frameworks = 'PhraseSDK.framework'
  s.requires_arc        = true
end
