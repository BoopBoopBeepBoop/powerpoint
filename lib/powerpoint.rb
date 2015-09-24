require "powerpoint/version"
require 'powerpoint/util'
require 'powerpoint/slide/intro'
require 'powerpoint/slide/textual'
require 'powerpoint/slide/pictorial'
require 'powerpoint/presentation'

module Powerpoint

  spec = Gem::Specification.find_by_name("powerpoint")
  ROOT_PATH = spec.gem_dir
  TEMPLATE_PATH = "#{ROOT_PATH}/template/"

  def self.decompress_pptx in_path, out_path
  	Zip::File.open(in_path) do |zip_file|
  	  zip_file.each do |f|
  	    f_path = File.join(out_path, f.name)
  	    FileUtils.mkdir_p(File.dirname(f_path))
  	    zip_file.extract(f, f_path) unless File.exist?(f_path)
  	  end
  	end
  end

  def self.compress_pptx in_path, out_path
    Zip::File.open(out_path, Zip::File::CREATE) do |zip_file|
      Dir.glob("#{in_path}/**/*", ::File::FNM_DOTMATCH).each do |path|
        zip_path = path.gsub("#{in_path}/","")
        next if zip_path == "." || zip_path == ".." || zip_path.match(/DS_Store/)
        begin
          zip_file.add(zip_path, path)
        rescue Zip::ZipEntryExistsError
          raise "#{out_path} allready exists!"
        end
      end
    end
  end  
end
