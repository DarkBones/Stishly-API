class User < ApplicationRecord
  include Friendlyable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :confirmable, :trackable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtBlacklist
end
