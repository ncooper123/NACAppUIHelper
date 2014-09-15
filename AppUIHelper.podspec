Pod::Spec.new do |s|
  s.name         = "AppUIHelper"
  s.version      = "0.0.1"
  s.summary      = "A helper class for performing various common UI actions."

  s.description  = "A helper class for performing various common UI actions."

  s.homepage = "https://github.com/ncooper123/"
  s.license = { :type => 'BSD' }
  s.author = { "Nathan" => "ncooper@uno.edu" }
  s.platform = :ios
  s.requires_arc = true
  s.source = { :git => "https://github.com/ncooper123/app-ui-helper.git", :branch => "master", :tag => '0.0.1' }
  s.source_files = "*.{h,m}"

end
