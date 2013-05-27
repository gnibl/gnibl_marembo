class User < ActiveRecord::Base
  attr_accessible :confirmed_password, :current_city, :email, :full_name, :password, :username
  def my_gnibs
   @my_gnibs = ["gnib pics (1)_img0.png", "gnib pics (1)_img1.png", "gnib pics (1)_img2.png", "gnib pics (1)_img3.png"]
  end
  def to_param
   username
  end
  def find(query)
   self.find_by_username(query) || super(query)
  end
end
