require 'spec_helper'

describe PrintsController, :type => :controller do
  describe 'views' do   
    it "renders the new view" do
      get :new
      expect(response).to render_template("new")
    end

    it "renders the queue view" do
      get :queue
      expect(response).to render_template("queue")
    end

    # it "should have the title '3d Printing Management'" do
    #   visit '/prints'
    #   page.should have_selector("title", text: "3d Printing Management", visible: false)
    # end
  end
end