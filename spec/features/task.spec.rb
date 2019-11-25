# With this require, Capybara and other features required for Feature Spec are enabled.
require 'rails_helper'

# On the right side of this RSpec.feature, write the test item name like "task management feature" (grouped by do ~ end)
RSpec.feature "Task management function", type: :feature do
  # In scenario (alias of it), write the processing of the test for each item you want to check.
  background  do
    User.create!(fullname: "blaise", email: 'ni@gmail.Com',password: '1234567')
  
 end
#  background  do
#     visit  root_path
#     fill_in  'Email',  with: 'ni@gmail.Com'
#     fill_in  'Password' ,  with: '1234567'
#     click_on  'Log in'
#     expect(page).to have_content 'User was successfully created.'
#  end
  

  scenario "Test task list" do
    @user=User.first
    Task.create!(name: 'adali', details: 'football', status:'Done', user_id: @user.id)
    Task.create!(name: 'patrick', details: 'bicycle', status:'Done', user_id: @user.id)
  
    task=Task.all
     assert task
  end


  scenario "Test task creation" do
    @user=User.first
    Task.create!(name: 'adali', details: 'pazo', status:'Done',user_id: @user.id )
    
    task=Task.last
    expect(task.name).to match("adali")
 

  end

  scenario "Test task details" do
    @user=User.first
    Task.create!(name: 'adali', details: 'pazo',status:'Done',user_id: @user.id )
    task=Task.last
    expect(task.name).to match("adali")
 
    
  end
  scenario "Check validation of task name" do
    task=Task.new('name': ' ', 'details': 'everleaf ')
    expect(task).not_to be_valid
  
    end
    scenario 'task descending buy deadline' do
      task=Task.all
       # status is column that is holding priority High,medium and finally low
      assert task.order('enddate DESC')
    end
 scenario "Check validation of task details" do
 task=Task.new('name': 'Blaise', 'details': ' ')
 expect(task).not_to be_valid
 end
 scenario 'task descending buy priority' do
  task=Task.all
  assert task.order('priority DESC')
end
 scenario "Test whether tasks are arranged in descending order of creation date" do
  assert Task.order('created_at DESC')
  end
end

