class Feed < ActiveRecord::Base
  has_many :favorites

  def image
    case type
    when "DotsScraping" then
      "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xpa1/v/t1.0-1/p50x50/10390197_1005847399466094_3276222663505967405_n.png?oh=64035ba74f3b7f60e0d19e1f9b6b72d2&oe=561587A8&__gda__=1446312599_28517af055f12b8750112669359d0fdc"
    when "ConnpassApi" then
      "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xat1/v/t1.0-1/p50x50/559639_840874085951353_6117858253664006650_n.png?oh=bb230e5aca7d958c7711761586ba02cd&oe=561AA43E&__gda__=1444343562_10a278df3cef4830465723a624cf05c1"
    end
  end

  def start_day
    started_at.strftime('%Y.%m.%d')
  end
end
