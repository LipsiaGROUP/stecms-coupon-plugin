require 'rubygems'
require 'rosebud'
require 'rqrcode'
require 'date_validator'
require 'flatpickr_rails'

module StecmsCoupon
  class Engine < ::Rails::Engine
    isolate_namespace StecmsCoupon

    config.before_initialize do
      config.i18n.load_path += Dir["#{config.root}/config/locales/**/*.yml"]
    end
  end
end
