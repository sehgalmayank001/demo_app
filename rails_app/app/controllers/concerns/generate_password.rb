module GeneratePassword
  extend ActiveSupport::Concern
  # Devise methods overwrites
  def paswd_gen
    (0...2).map { (97 + rand(26)).chr }.join + Random.rand(9999999).to_s + (65 + rand(26)).chr
  end
end
