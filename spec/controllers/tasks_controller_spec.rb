require 'rails_helper'

RSpec.describe TasksController, type: :controller do
	describe "tasks#index" do
		it "should properly list out all the tasks in the db" do
			task1 = FactoryGirl.create(:task)
			taks2 = FactoryGirl.create(:task)
			get :index
			expect(response).to have_http_status :success
			response_value = ActiveSupport::JSON.decode(@response.body)
			expect(response_value.count).to eq(2)
		end
	end

	describe "tasks#update" do 
		it "should allow tasks to be marked as done" do
			task = FactoryGirl.create(:task, done: false)
			put :update, id: task.id, task: { done: true}
			expect(response).to have_http_status(:success)
			task.reload
			expect(task.done).to eq(true)
		end
	end

end
