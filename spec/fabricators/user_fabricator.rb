require 'tzinfo'

Fabricator(:user) do
  pword = ([*('A'..'Z'),*('0'..'9')]-%w(0 1 I O)).sample(16).join
  first_name ([*('A'..'Z'),*('0'..'9')]-%w(0 1 I O)).sample(16).join
  last_name ([*('A'..'Z'),*('0'..'9')]-%w(0 1 I O)).sample(16).join
  timezone TZInfo::Timezone.all_country_zone_identifiers.sample
  country ['IE', 'CA', 'NL', 'BE', 'LU', 'US', 'GB', 'AF'].sample
  currency ['EUR', 'CAD', 'USD', 'JPY', 'AUD'].sample
  hash_id ([*('A'..'Z'),*('0'..'9')]-%w(0 1 I O)).sample(16)
  email "#{([*('A'..'Z'),*('0'..'9')]-%w(0 1 I O)).sample(16).join}@stishly.com"
  password pword
  encrypted_password User.new.send(:password_digest, pword)
  remember_created_at Time.now.utc
  sign_in_count 1
  confirmation_token ([*('A'..'Z'),*('0'..'9')]-%w(0 1 I O)).sample(32).join
  confirmed_at 1.day.ago
  confirmation_sent_at 1.day.ago
  failed_attempts 0
  unlock_token 'nil'
  created_at 2.days.ago
  updated_at 2.days.ago
  unconfirmed_email 'test@stishly.com'
end