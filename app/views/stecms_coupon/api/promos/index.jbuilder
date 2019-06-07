json.promos @promos do |promo|
  json.identifier promo.identifier
  json.name promo.name
  json.description promo.description
  json.cover promo.cover.full_url if promo.cover.present?
end
