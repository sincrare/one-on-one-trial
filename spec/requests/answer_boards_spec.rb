require 'rails_helper'

RSpec.describe "AnswerBoards", type: :request do
  describe "GET /answer_boards" do
    it "works! (now write some real specs)" do
      get answer_boards_path
      expect(response).to have_http_status(200)
    end
  end
end
