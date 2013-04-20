class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ROLES = %w[user authoritative_editor editor]

  ROLES.each do |role_name|
    define_method "#{role_name}?" do
      self.role == role_name
    end
  end
end
