class ImagesController < ApplicationController
  def setimage
    if (params[:image].present? && params[:folder_name].present?)
      @file_name = params[:image].original_filename
      @folder_name = params[:folder_name]
      @img = image_path("#{@folder_name}/#{@file_name}")

      dir = "./app/assets/images/#{@folder_name}"
      if File.directory?(dir)
        redirect_to root_path, alert: "Folder already existed"
      else
        FileUtils.mkdir_p(dir)
        File.open(Rails.root.join("app", "assets", "images", @folder_name, @file_name), "wb") do |file|
          file.write(params[:image].read)
          render "image"
          return
        end
      end
    else
      redirect_to root_path, alert: "Input fields are required"
      return
    end
  end
end

