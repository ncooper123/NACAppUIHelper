Pod::Spec.new do |s|
  s.name         = "NACAppUIHelper"
  s.version      = "0.0.2"
  s.summary      = "A helper class for performing various common UI actions."

  s.description  = "A helper class for performing various common UI actions."

  s.homepage = "https://github.com/ncooper123/"
  s.license = { :type => 'BSD' }
  s.author = { "Nathan" => "ncooper@uno.edu" }
  s.platform = :ios
  s.requires_arc = true
  s.source = { :git => "https://github.com/ncooper123/NACAppUIHelper", :branch => "master", :tag => '0.0.2' }
  s.source_files = "*.{h,m}"

end
