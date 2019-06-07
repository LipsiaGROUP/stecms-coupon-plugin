class StecmsCoupon::Promo < ActiveRecord::Base
  mount_uploader :cover, FileUploader

  validates :name, presence: true
  validates :identifier,   presence: true, uniqueness: { case_sensitive: false }
  validates :valid_from, 	 presence: true, if: Proc.new { |a| a.valid_until.blank? }
  validates :valid_until , presence: true, if: Proc.new { |a| a.valid_from.blank? }
  validates :valid_until, date: { after: :valid_from }

  validates :coupon_usable_from,  date: { after_or_equal_to: :valid_from, allow_blank: true }
  validates :coupon_usable_until, date: { after: :coupon_usable_from,     allow_blank: true }

  validates :usage_time_per_device, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :usage_coupon_times,    numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  has_one  :survey,  :dependent => :destroy, class_name: 'StecmsCoupon::SurveyForm', foreign_key: :stecms_coupon_promo_id, inverse_of: :promo
  has_many :coupons, :dependent => :destroy, class_name: 'StecmsCoupon::Coupon',     foreign_key: :stecms_coupon_promo_id, inverse_of: :promo

  scope :visible,     -> { where(visible: true) }
  scope :not_expired, -> { where('valid_until >= ? AND valid_from <= ?', Time.zone.now, Time.zone.now) }
  scope :active,      -> { where(active: true) }

  def cover_image
    if cover.present?
      cover.full_url
    else
      "https://via.placeholder.com/320x240"
    end
  end

  def self.check_valid_and_active(identifier)
    return_data = {status: true, message: '', obj: nil}
    promo = StecmsCoupon::Promo.where(identifier: identifier).last

    if promo.present?
      return_data[:obj] = promo
      if promo.valid_from.present? and promo.valid_until.present?
        unless (promo.valid_from.to_i .. promo.valid_until.to_i).cover?(Time.now.to_i)
          return_data[:message] = 'QR not valid time'
          return_data[:status] = false
        end
      elsif promo.valid_from.present?
        if Time.now.to_i < promo.valid_from.to_i
          return_data[:message] = 'Promo not started yet!'
          return_data[:status] = false
        end
      elsif promo.valid_until.present?
        if Time.now.to_i > promo.valid_until.to_i
          return_data[:message] = 'Promo has ended!'
          return_data[:status] = false
        end
      end
    else
      return_data[:message] = 'Promo not found'
      return_data[:status] = false
    end
    return_data
  end

  private
    def set_promo_date_range_to_coupons
      self.coupon_usable_from  = self.valid_from  if self.coupon_usable_from.blank?
      self.coupon_usable_until = self.valid_until if self.coupon_usable_until.blank?
    end

end
