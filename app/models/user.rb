class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :articles, foreign_key: :creator_id, inverse_of: :creator
  has_many :taxonomies, foreign_key: :authoritative_editor_id, inverse_of: :authoritative_editor

  ROLES = %w[author authoritative_editor editor]

  ROLES.each do |role_name|
    define_method "#{role_name}?" do
      read_attribute(:role) == role_name
    end
  end

end
