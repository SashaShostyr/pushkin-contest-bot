require 'net/http'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def send_post(answer, task_id)
    uri = URI("http://pushkin.rubyroidlabs.com/quiz")
    parameters = {
        answer: answer,
        token: '085ad470997196171170a77ed48f96e0',
        task_id: task_id
    }
    Net::HTTP.post_form(uri, parameters)
    render json: 'done'
  end
end
