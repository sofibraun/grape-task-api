require 'grape'
require 'rack/cors'

class API < Grape::API

  format :json
  content_type :txt, "text/plain"

  get "tasks" do
    Task.all
  end

  get 'tasks/:id' do
    Task.find(params[:id])
  end

  post "tasks" do
    task = Task.new name: params[:name], description: params[:description]
    if task.save
      { taskId: task.id }
    else
      error!({ errors: task.errors.messages }, 403)
    end
  end

  put "tasks/:id" do
    task = Task.find(params[:id])
    task.name = params[:name]
    task.description = params[:description]
    if task.save
      { taskId: task.id }
    else
      error!({ errors: task.errors.messages }, 403)
    end
  end

  delete "tasks/:id" do
    Task.find(params[:id]).destroy
  end

end
