class ReadController < ApplicationController
  def show
    @file_location = "./public/sample.txt"
    @file = File.open(@file_location)
    @data = @file.read
    render "show"
  end
end
