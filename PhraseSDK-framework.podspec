Pod::Spec.new do |s|
  s.name                = 'PhraseSDK-framework'
  s.version             = '3.0.0'
  s.summary             = 'iOS SDK for Phrase'
  s.homepage            = 'https://phrase.com'
  s.documentation_url   = 'https://help.phrase.com/help/phrase-over-the-air-introduction'
  s.license             = { :type => 'Commercial', :file => 'LICENSE.md' }
  s.author              = { 'Dynport GmbH' => 'support@phrase.com' }

  s.source              = { :git => 'https://github.com/phrase/ios-sdk.git', :tag => s.version }
  s.platform            = :ios, '9.0'

  s.frameworks          = 'Foundation', 'UIKit'
  s.preserve_paths      = 'PhraseSDK.framework'
  s.vendored_frameworks = 'PhraseSDK.framework'
  s.module_name         = 'PhraseSDK'
  
  s.swift_version       = '5.0'
  s.requires_arc        = true
end
