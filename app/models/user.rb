class User < ActiveRecord::Base
    has_secure_password
    has_many :leads
    validates_presence_of :username, :email, :password
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    validates :email, uniqueness: true
    validates :username, uniqueness: true


  
    def slug
      self.username.downcase.gsub("&","and").gsub(" ","-").gsub(/[^a-z\-\d]/,"")

    end
  
    def self.find_by_slug(slug)
      self.all.detect {|i| i.slug == slug}
    end
  
  end