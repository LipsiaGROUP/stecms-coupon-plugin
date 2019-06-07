class StecmsCoupon::Coupon < ActiveRecord::Base
  belongs_to :promo, class_name: 'StecmsCoupon::Promo', foreign_key: :stecms_coupon_promo_id
  before_validation :set_default_identifier, if: -> { self.identifier.blank? }

  validates :identifier, uniqueness: { case_sensitive: false }, presence: true
  validates :max_usage_times, numericality: { only_integer: true }

  def set_default_identifier
    self.identifier = generate_coupon_identifer
  end

  def generate_coupon_identifer
    loop do
      coupon_code = rand(36**12).to_s(36).upcase
      break coupon_code unless StecmsCoupon::Coupon.where(identifier: coupon_code).exists?
    end
  end

  def update_usage_coupon
    self.usage_times += 1
    self.save
  end

  def check_coupon_status
    return_data = {status: true, message: '', obj: nil}
    usage_after_count = self.usage_times + 1
    if self.max_usage_times < usage_after_count
      return_data[:message] = 'coupon already reach the limit!'
      return_data[:status] = false
    else
      if self.valid_from.present? and self.valid_until.present?
        unless (self.valid_from.to_i .. self.valid_until.to_i).cover?(Time.now.to_i)
          return_data[:message] = 'Coupon not valid time'
          return_data[:status] = false
        end
      elsif self.valid_from.present?
        if Time.now.to_i < self.valid_from.to_i
          return_data[:message] = 'coupon time not started yet!'
          return_data[:status] = false
        end
      elsif self.valid_until.present?
        if Time.now.to_i > self.valid_until.to_i
          return_data[:message] = 'coupon has ended!'
          return_data[:status] = false
        end
      end
    end
    return_data
  end

  def self.check_valid_and_active(identifier, device)
    return_data = {status: true, message: '', obj: nil}
    coupon = StecmsCoupon::Coupon.where(identifier: identifier, device: device).last

    if coupon.present?
      return_data[:obj] = coupon

      data = coupon.check_coupon_status
      return_data[:status] = data[:status]
      return_data[:message] = data[:message]
    else
      return_data[:message] = 'coupon not found'
      return_data[:status] = false
    end
    return_data
  end

  def self.generate_coupon(promo, device)
    StecmsCoupon::Coupon.create(stecms_coupon_promo_id: promo.id,
      device: device,
      valid_from: promo.coupon_usable_from,
      valid_until: promo.coupon_usable_until,
      generated_at: Time.zone.now,
      active: true,
      max_usage_times: promo.usage_coupon_times)
  end

end
