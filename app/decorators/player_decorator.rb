class PlayerDecorator < Draper::Decorator
  delegate_all

  def fullname
    "#{name} #{surname}"
  end
end
