class User < ActiveRecord::Base
    has_secure_password
    has_many :leads
    validates_presence_of :username, :email, :password
  
    def slug
      self.username.downcase.gsub("&","and").gsub(" ","-").gsub(/[^a-z\-\d]/,"")

    end
  
    def self.find_by_slug(slug)
      self.all.detect {|i| i.slug == slug}
    end
  
  end