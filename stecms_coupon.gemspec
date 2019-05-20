$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "stecms_coupon/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "stecms-coupon-plugin"
  s.version     = StecmsCoupon::VERSION
  s.authors     = ["Mada Aryakusumah"]
  s.email       = ["lokermada@gmail.com"]
  s.homepage    = "https://www.lipsiagroup.com/it"
  s.summary     = "Coupon library for STECMS"
  s.description = "Coupon library for STECMS."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.10" 
  s.add_dependency 'rosebud'
  s.add_dependency 'rqrcode'
  s.add_dependency 'date_validator'
  s.add_dependency 'flatpickr_rails'
end
