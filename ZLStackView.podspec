#
# Be sure to run `pod lib lint ZLStackView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZLStackView'
  s.version          = '0.1.3'
  s.summary          = 'A short description of ZLStackView.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/FPJack/ZLStackView.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'fanpeng' => '2551412939@qq.com' }
  s.source           = { :git => 'https://github.com/FPJack/ZLStackView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  
  
  s.subspec 'Layout' do |layout|
    layout.source_files = 'ZLStackView/Classes/Layout/**/*'
  end
  
  s.subspec 'StackView' do |stackView|
    stackView.source_files = 'ZLStackView/Classes/StackView/**/*'
    stackView.dependency 'ZLStackView/Layout'
  end
  
  s.subspec 'UIKit' do |core|
    core.source_files = 'ZLStackView/Classes/UIKit/**/*'
    core.dependency 'ZLStackView/StackView'
  end
  
  
  s.subspec 'Swift' do |core|
    core.source_files = 'ZLStackView/Classes/Swift/**/*'
    core.dependency 'ZLStackView/UIKit'
  end
  
  # s.resource_bundles = {
  #   'ZLStackView' => ['ZLStackView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
