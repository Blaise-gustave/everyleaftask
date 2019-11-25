require 'rails_helper'
RSpec.feature "user management function", type: :feature do
background do
  User.create!(fullname: "admin", email: 'admin@gmail.Com',  password: '321654' )
  visit  root_path
  
end
scenario "Test number of users" do
  @user = User.all.count
  expect(@user).to eq 1
end
    
scenario "Test user list" do
  user=User.all
  assert user
end
scenario "Test user creation" do
  User.create!(fullname: 'lala', email: 'lala@gmail.com', password: '123456' )
  user=User.last
  expect(user.fullname).to match("lala")
end
scenario "Test user details" do
  @user= User.create!(fullname: 'admin', email: 'admn@gmail.com', password: '321654')
  visit admin_user_path(id: @user.id)
end
scenario 'Test user Deletion' do
  User.create!(fullname: 'momo', email: 'm@gmail.com', password: '123456')
  @user = User.last
   assert @user.destroy
end
end