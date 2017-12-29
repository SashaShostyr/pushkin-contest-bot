require 'json'
require 'pry'

def delete_punctuation(string)
  string.tr("«»\!\*\(\)\№\;\?\,\.\'\:\"\—","")
end

file = File.read(File.expand_path("./db/poems-full.json"))
data = JSON.parse(file)

DATA1 = {}
data.each do |poem|
  poem[1].each do |line|
    if poem[0].match(/[\*]/).nil?
      DATA1[delete_punctuation(line)] = poem[0]
    elsif
      DATA1[delete_punctuation(line)] = poem[1][0]
    end
  end
end
File.open('db/level1.json', 'w') do |f|
  f.write(DATA1.to_json)
end

DATA2 = {}
data_all_lines = data.map {|d| d[1]} 
data_all_lines.flatten.uniq.each do |line|
  words = delete_punctuation(line).split(' ')
  words.each do |word|
    new_line = line.sub(/#{word}/, '%WORD%')
    DATA2[delete_punctuation(new_line)] = word
  end
end

File.open('db/level2.json', 'w') do |f|
  f.write(DATA2.to_json)
end

DATA6 = {}
data.each do |poem|
  poem[1].each do |line|
    key = delete_punctuation(line).tr(' ', '').chars.sort.join
    DATA6[key] = line 
  end
end
File.open('db/level6.json', 'w') do |f|
  f.write(DATA6.to_json)
end

DATA_LEVEL1 = JSON.parse File.read(File.expand_path("./db/level1.json"))
DATA_LEVEL2 = JSON.parse File.read(File.expand_path("./db/level2.json"))
DATA_LEVEL6 = JSON.parse File.read(File.expand_path("./db/level6.json"))
