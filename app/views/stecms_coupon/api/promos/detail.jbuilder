json.promo @promo
json.promo_cover @promo.try(:cover_image)

unless @promo.present?
  json.message t("admin.promo.status.not_found", identifier: params[:identifier])
end
