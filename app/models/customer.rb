class Customer < ActiveRecord::Base
  before_create :activate

  def destroy
    self.active = false
    save
  end

  private
  def activate
    self.active = true
  end
end
