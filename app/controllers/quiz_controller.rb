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
    send_post(@answer, @task_id)
    Question.create(question: @question, answer: @answer, task_id: @task_id, level: @level)
  end
  
  def give_answer
    case @level.to_i
    when 1
      solve_level1
    when 2
      solve_level2
    when 3..4
      solve_level34
    when 5
      solve_level5
    when 6
      solve_level6
    when 7
      solve_level7
    end
  end

  def solve_level1
    DATA_LEVEL1[delete_punctuation(@question)]
  end

  def solve_level2
    DATA_LEVEL2[delete_punctuation(@question)]
  end

  def solve_level34
    lines = @question.split("\n")
    answers = []
    lines.each do |line|
      answers << DATA_LEVEL2[delete_punctuation(line)]
    end
    answers.join(',')
  end

  def solve_level5
    answers = []
    delete_punctuation(@question).split(' ').each do |word|
      new_str = delete_punctuation(@question).gsub(word, "%WORD%")
      unless DATA_LEVEL2[new_str].nil?
        answers << DATA_LEVEL2[new_str] << word
      end
    end
    answers.join(',')
  end

  def solve_level6
    DATA_LEVEL6[delete_punctuation(@question).tr(' ', '').chars.sort.join]
  end

  def solve_level7
    DATA_LEVEL6[delete_punctuation(@question).tr(' ', '').chars.sort.join]
  end

  def quiz_params
    params.permit(:question, :id, :level)
  end
end
