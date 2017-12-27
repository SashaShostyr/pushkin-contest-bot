require 'json'
require 'pry'

def delete_punctuation(string)
  string.tr("«»\!\*\(\)\№\;\?\,\.\'\:\"\—","")
end

file = File.read(File.expand_path("./db/poems-full.json"))
data = JSON.parse(file)

DATA_LEVEL1 = {}
data.each do |poem|
  poem[1].each do |line|
    if poem[0].match(/[\*]/).nil?
      DATA_LEVEL1[line] = poem[0]
    elsif
      DATA_LEVEL1[line] = poem[1][0]
    end
  end
end
#File.open('level1.json', 'w') do |f|
  #f.write(DATA_LEVEL1.to_json)
#end

DATA_LEVEL2 = {}
data_all_lines = data.map {|d| d[1]} 
data_all_lines.flatten.uniq.each do |line|
  words = delete_punctuation(line).split(' ')
  words.each do |word|
    new_line = line.sub(/#{word}/, '%WORD%')
    DATA_LEVEL2[new_line] = word
  end
end

#File.open('level2.json', 'w') do |f|
  #f.write(DATA_LEVEL2.to_json)
#end
