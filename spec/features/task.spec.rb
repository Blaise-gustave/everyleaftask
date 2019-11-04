# With this require, Capybara and other features required for Feature Spec are enabled.
require 'rails_helper'

# On the right side of this RSpec.feature, write the test item name like "task management feature" (grouped by do ~ end)
RSpec.feature "Task management function", type: :feature do
  # In scenario (alias of it), write the processing of the test for each item you want to check.
  scenario "Test task list" do
    Task.create!(name: 'adali', details: 'football')
    Task.create!(name: 'patrick', details: 'bicycle')
  
    # visit to tasks_path (transition to task list page)
    visit tasks_path
  
     
    expect(page).to have_content 'football'
    expect(page).to have_content 'bicycle'
  end

  scenario "Test task creation" do
    visit new_task_path
    fill_in 'Name', with: 'pazo'
    fill_in 'Details', with: 'swiming'
    click_button 'Create Task'
    visit tasks_path
    Task.create!(name: 'adali', details: 'pazo')
    Task.create!(name: 'patrick', details: 'swiming')

  end

  scenario "Test task details" do
    visit  new_task_path
    fill_in  'Name' ,  with: 'grettings'
    fill_in  'Details' ,  with: 'test'
    click_on 'Create Task'
    click_on 'Back'
    click_on 'Show'
    expect(page).to have_text('test')
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

