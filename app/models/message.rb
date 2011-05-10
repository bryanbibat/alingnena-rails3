class Message < ActiveRecord::Base
  validates_presence_of :author, :message
  before_validation :set_anonymous
  
  private

    def set_anonymous
      self.author = "Anonymous" if author.blank?
    end
end
