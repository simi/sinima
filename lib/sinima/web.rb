require 'sinatra'
require 'json'
require 'fileutils'

module Sinima
  class Web < Sinatra::Base
    set :root, File.expand_path('../../', File.dirname(__FILE__))
    set :video_folder,  Proc.new { File.join(public_folder, "videos") }

    get '/:name' do
      erb :video
    end

    get '/' do
      files = Dir.glob(File.join(settings.video_folder, '*.webm'))
      files.to_json
    end

    post '/' do
      tempfile = params[:file][:tempfile] 
      filename = params[:file][:filename] 
      FileUtils.cp(tempfile.path, File.join(settings.video_folder, filename))
      request.url + '/' + filename
    end
  end
end