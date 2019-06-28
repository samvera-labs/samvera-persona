class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attr_accessor :roles
  # devise :invitable, :database_authenticatable, :confirmable, :invitable

  def roles
    @roles ||= []
  end

  def add_role(role)
    roles << role unless roles.include?(role)
  end

  def remove_role(role)
    roles.delete(role)
  end

  def groups=(value)
    roles = value
  end

  def groups
    roles
  end


end

