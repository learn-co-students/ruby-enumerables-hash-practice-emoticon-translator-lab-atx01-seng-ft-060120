require "yaml"
require "pry"

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  final_hash = emoticons.each_with_object({}) do |(keys, values), final_hash|
    if !final_hash[keys]
      final_hash[keys] = {:english=>values[0], :japanese=>values[1]}
    end
  end
end


def get_english_meaning(file_path, emoticon)
  emoticon_file = load_library(file_path)
  emoticon_file.each do |emotion_name, inner_hash|
    if inner_hash[:japanese] == emoticon
      return emotion_name
  end
end
return "Sorry, that emoticon was not found"
end



def get_japanese_emoticon(file_path, emoticon)
  emoticon_file = load_library(file_path)
  emoticon_file.each do |emotion_name, inner_hash|
    if inner_hash[:english] == emoticon
      return inner_hash[:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end





#binding.pry
