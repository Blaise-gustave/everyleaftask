require 'rails_helper'
RSpec.describe Task, type: :model do
 it "Validation does not pass if the name is empty" do
   task = Task.new(name: '', details: 'Failure test')
   expect(task).not_to be_valid
 end
 it "Validation does not pass if details is empty" do
   task = Task.new(name: 'test', details: '')
   expect(task).not_to be_valid
 end
 it "validation passes If content is described in name and details" do
  @user=User.create!(fullname:"Blaise", email:"b@gmail.com",telephone:"01922938383",password:"123456",password_confirmation:"123456")
   task = Task.new(name: 'vv', details: 'Failure test',status:"done",user_id:@user.id)
   expect(task).to be_valid
 end
 it "can search" do

   @user=User.create!(fullname:"Blaise", email:"b@gmail.com",telephone:"01922938383",password:"123456",password_confirmation:"123456")
   task = Task.new(name: 'vv', details: ' test',status:"done",user_id: @user.id)

  assert task
 end
end