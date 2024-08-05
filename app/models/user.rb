class User < ApplicationRecord

  acts_as_tenant(:company)
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  belongs_to :company, optional: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  enum role: {
    owner: 0,
    admin: 1,
    supervisor: 2,
    staff: 3,
    maintainer: 4
  }
end
