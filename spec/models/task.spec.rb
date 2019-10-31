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
   task = Task.new(name: 'vv', details: 'Failure test')
   expect(task).to be_valid
 end
end