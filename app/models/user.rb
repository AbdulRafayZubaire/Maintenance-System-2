class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attr_accessor :company_name, :subdomain, :logo

  acts_as_tenant(:company)
  belongs_to :company, optional: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
         
  enum role: {
    owner: 0,
    admin: 1,
    supervisor: 2,
    staff: 3,
    maintainer: 4
  }
end
