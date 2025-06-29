Pod::Spec.new do |s|
  s.name                = 'PhraseSDK'
  s.version             = '5.1.0'
  s.summary             = 'iOS SDK for Phrase'
  s.homepage            = 'https://phrase.com'
  s.documentation_url   = 'https://help.phrase.com/help/phrase-over-the-air-introduction'
  s.license             = { :type => 'Commercial', :file => 'LICENSE.md' }
  s.author              = { 'Phrase GmbH' => 'support@phrase.com' }

  s.source              = { :git => 'https://github.com/phrase/ios-sdk.git', :tag => s.version }
  s.platform            = :ios, '15.0'

  s.frameworks          = 'Foundation', 'UIKit'
  s.preserve_paths      = 'PhraseSDK.xcframework'
  s.vendored_frameworks = 'PhraseSDK.xcframework'
  
  s.swift_version       = '6.0'
  s.requires_arc        = true
end
