class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

# As a Prosumer
  has_one :solar_panel
  has_many :contracts

  # As a Consumer
  has_many :contracted_solar_panels, through: :contracts, source: :solar_panel


  # validates_presence_of :first_name
  # validates_presence_of :last_name

  def self.find_for_facebook_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.first_name   # assuming the user model has a name
      user.last_name = auth.info.last_name   # assuming the user model has a name
      user.facebook_picture_url = auth.info.image # assuming the user model has an image
      user.token = auth.credentials.token
      user.token_expiry = Time.at(auth.credentials.expires_at)
    end
  end



  def is_producer?
    solar_panel.try(:persisted?)
  end

  def is_consumer?
    contracts.any?
  end

end

