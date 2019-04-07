class QuestionsController < ApplicationController

def index
  @part_id = params[:id]
  @part = Part.find(@part_id)
  @questions = @part.questions
  @howmuch_testing = 5
  @setanswer = []
  redirect_to testing_new_question_path
end

end
