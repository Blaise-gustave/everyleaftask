require 'rails_helper'
# On the right side of this RSpec.feature, write the test item name like "task management feature" (grouped by do ~ end)
RSpec.feature "Label Management function", type: :feature do
 # In scenario (alias of it), write the processing of the test for each item you want to check.

 scenario "Can create label" do
   @user= User.create!(fullname: "mentor", email: 'mentor@gmail.Com',  password: '321654' )
    @label = Label.create!(name: "TestLabel", user_id: @user.id)
   assert @label
  end
#  scenario "can search by attached labels " do
#     visit new_label_path
#     fill_in 'Name', with: 'label11'
#     click_on 'Create Label'
#     visit new_label_path
#     fill_in 'Name', with: 'label2'
#     fill_in 'Content', with: 'testlabel2'
#     click_on 'Create Label'
#     @user=User.first
#     @task = Task.create!(title: "Test", content: 'test2',status: 'In progress',usr_id: @user.id)
#     @label1 = Label.first
#      @label2 = Label.last
#      @task.labels = [@label1,@label2]
#     @task.save
#     visit tasks_path
#     fill_in  'key' ,  with: 'label1'
#     click_on 'Search'
#     expect(page).to have_content('test2')
#   end
end