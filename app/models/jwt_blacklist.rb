# == Schema Information
#
# Table name: jwt_blacklist
#
#  id  :bigint           not null, primary key
#  jti :string           not null
#

class JwtBlacklist < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Blacklist

  self.table_name = 'jwt_blacklist'
end
