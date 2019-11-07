require 'yaml'
require 'pry'

def load_library(library)
  emoticons = YAML.load_file(library)
  new_hash = {
    :get_emoticon => {},
    :get_meaning => {}
  }
 emoticons.each do |meaning, translation|
   english = translation[0]
   japanese = translation[1]
   new_hash[:get_emoticon][english] = japanese
   new_hash[:get_meaning][japanese] = meaning
 end
 return new_hash
end

def get_japanese_emoticon(library, emoticon)
  file_path = load_library(library)
  
  result = file_path[:get_emoticon][emoticon]
  if result == nil
    result = "Sorry, that emoticon was not found" 
  end
  result
   
end

def get_english_meaning(library, emoticon)
  file_path = load_library(library)
  
  result = file_path[:get_meaning][emoticon]
  if result == nil
    result = "Sorry, that emoticon was not found"
  end
  result
end

