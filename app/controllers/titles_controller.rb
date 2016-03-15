class TitlesController < ApplicationController
  set :views, Proc.new { File.join(root, "../views/") }

  get '/titles' do
    erb :'/titles/index'
  end
end
