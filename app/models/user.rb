class User < ApplicationRecord
  attr_accessor :roles

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

