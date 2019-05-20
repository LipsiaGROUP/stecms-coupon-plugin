module StecmsCoupon
  module CouponsHelper
    # returns splitted string with separator
    def formatted_coupon_identifier(identifier, length = 4, separator = "-")
      identifier.to_s.scan(/.{,#{length}}/).reject{|a| a.blank?}.join(separator)
    end
  end

end
