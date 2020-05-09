# require modules here
require "yaml"
def load_library(file_path)
  get_english = {}
  get_japanese = {}
  get_e_emoticon = {}
  get_j_emoticon = {}
  new_hash = {}
  library = YAML.load_file(file_path)
  library.each do |keys, arrays|
    # arrays.each do |emojis| 
      new_hash[keys] =  { :english => arrays[0],
      :japanese => arrays[1]}
     get_english[(arrays[0])] = keys
     get_japanese[(arrays[1])] = keys
     get_e_emoticon[(arrays[1])] = arrays[0] 
     get_j_emoticon[(arrays[0])] = arrays[1]
      
    
  end 
      new_hash["get_english"] = get_english 
      new_hash["get_japanese"] = get_japanese
      new_hash["get_e_emoticon"] = get_e_emoticon
      new_hash["get_j_emoticon"] = get_j_emoticon
      new_hash
end

def get_japanese_emoticon(file_path, 
  english_emoticon)
  library = load_library(file_path)
  if library["get_j_emoticon"].include?(english_emoticon)
    library["get_j_emoticon"][english_emoticon] 
    
  else 
    "Sorry, that emoticon was not found"
  end 
end

def get_english_meaning(file_path, 
  japanese_emoticon)
  library = load_library(file_path)
  if library["get_japanese"].include?(japanese_emoticon)
    library["get_japanese"][japanese_emoticon]
    
  else 
    "Sorry, that emoticon was not found"
  
  end 
end 

puts get_english_meaning("./lib/emoticons.yml", ";;")