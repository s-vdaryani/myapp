class WelcomeController < ApplicationController
  def index
    render plain: "HELLO WORLD"
  end
end
