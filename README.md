## Stecms Coupon Plugin

This plugin provide feature for managing promo and coupon for STECMS.

## Installation
Add this line to your application's Gemfile:
```ruby
gem 'stecms_coupon', github: 'LipsiaGROUP/stecms-coupon-plugin'
```

And then execute:

    $ bundle
    
## Usage

Add this line to app/assets/javascripts/backend/backend.js

```javascript
//= require stecms_coupon
```

Add this line to config/routes/backend_routes.rb (inside namespace :backend block)

```ruby
mount StecmsCoupon::Engine, at: "/stecms_coupon", as: 'stecms_coupon'
```

Run this command to generate required migration:
```ruby
 rake railties:install:migrations
```

and then `rake db:migrate`

You can setup link (usually on `app/views/backend/_backend_menu.haml`) with this:
```ruby
 link_to 'Promotion', StecmsCoupon::Engine.routes.url_helpers.promos_path
```
