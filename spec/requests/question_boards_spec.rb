require 'rails_helper'

RSpec.describe "QuestionBoards", type: :request do
  describe "GET /question_boards" do
    it "works! (now write some real specs)" do
      get question_boards_path
      expect(response).to have_http_status(200)
    end
  end
end
