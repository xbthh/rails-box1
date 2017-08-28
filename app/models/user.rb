class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  ROLES = ["admin", "editor"]

  has_many :registrations

  has_one :profile
  accepts_nested_attributes_for :profile
  has_many :memberships
  has_many :groups, :through => :memberships

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def display_name
    self.email.split("@").first
  end

  def is_admin?
    return true
  end

end
