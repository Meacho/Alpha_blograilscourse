require 'test_helper'

class CreateUserTest < ActionDispatch::IntegrationTest
 
  
  test "can I signup" do
    get signup_path  
    assert_template 'users/new'
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: {username: "Bob", email: "bob@email.com", password: "Password", admin: false}
    end
    assert_template 'users/show'
    assert_match "Bob", response.body
  
  end
  
  
  
end