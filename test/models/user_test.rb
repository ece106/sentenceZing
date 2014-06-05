require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  fixtures :users
  
  test "user fields can't be empty" do
    users = User.new
    assert users.invalid?
    assert users.errors[:email].any?
    assert users.errors[:password].any? 
  end
  
  test "email must be in correct format" do
    users = Users.new(:email    => "notanemail",
                      :password => "StrongPass1")
                      
    assert users.invalid?
    assert_equal "Email must be in correct format",
      user.errors[:email].join(';')
    
    users.email = "newUser@gmail.com";
    assert users.valid?
  end
    
    
    
end
