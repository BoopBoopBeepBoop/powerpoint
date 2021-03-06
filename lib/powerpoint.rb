require 'powerpoint/version'
require 'powerpoint/util'
require 'powerpoint/slide/intro'
require 'powerpoint/slide/text_content'
require 'powerpoint/slide/default_slide'
require 'powerpoint/slide/image_content'
require 'powerpoint/slide/table_content'
require 'powerpoint/slide/text'
require 'powerpoint/compression'
require 'powerpoint/presentation'

module Powerpoint
  ROOT_PATH = File.expand_path("../..", __FILE__)
  TEMPLATE_PATH = "#{ROOT_PATH}/template/"
  VIEW_PATH = "#{ROOT_PATH}/lib/powerpoint/views/"
end
