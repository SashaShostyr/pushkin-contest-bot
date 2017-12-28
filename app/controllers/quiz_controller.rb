class QuizController < ApplicationController
  skip_before_action :verify_authenticity_token 

  def index
    @questions = Question.all
  end

  def new
    @question = params[:question]
    @task_id = params[:id]
    @level = params[:level]
    @answer = give_answer
    Question.create(question: @question, answer: @answer, task_id: @task_id, level: @level)
    send_post(@answer, @task_id)
  end
  
  def give_answer
    case @level.to_i
    when 1
      solve_level1
    end
  end

  def solve_level1
    DATA_LEVEL1[@question]
  end

  def quiz_params
    params.permit(:question, :id, :level)
  end
end
