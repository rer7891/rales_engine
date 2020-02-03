class ApplicationController < ActionController::API
  helper_method :random_helper

  def self.random_helper
    count = self.count
    random_offset = rand(count)
    random_object = self.offset(random_offset).first
  end
end
