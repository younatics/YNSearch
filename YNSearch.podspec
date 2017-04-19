#
# Be sure to run `pod lib lint YNDropDownMenu.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YNSearch'
  s.version          = '0.3.1'
  s.summary          = 'Awesome fully customizable search view written in Swift 3'

  s.description      = <<-DESC
                        Awesome search view, written in Swift 3, appears search view like Pinterset Search view. You can fully customizable this library
                        DESC

  s.homepage         = 'https://github.com/younatics/YNSearch'
  s.screenshots      = 'https://raw.githubusercontent.com/younatics/YNDropDownMenu/master/Images/YNDropDownMenu.gif'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { "Seungyoun Yi" => "younatics@gmail.com" }

  s.source           = { :git => 'https://github.com/younatics/YNSearch.git', :tag => s.version.to_s }
  s.source_files     = 'YNSearch/*.swift'
  s.resources        = "YNSearch/*.xcassets"

  s.ios.deployment_target = '8.0'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.requires_arc = true
end
