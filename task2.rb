s = ARGV[0]
string_length = s.length
table = Array.new(string_length) { Array.new(string_length) }
for i in 0...string_length do
  for j in i + 1...string_length do
    table[i][j] = s[i] == s[j] ? 1 : 0
  end
end

max_substring_length = 0
max_substring = ''
i = 1
while i <= (string_length - 1)
  substring_length = 0
  substring = ''
  for j in 0...string_length - i do
    if table[j][j + i] == 1
      substring_length += 1
      substring << s[j]
    else
      if substring_length > max_substring_length
        max_substring_length = substring_length
        max_substring = substring
        substring_length = 0
        substring = ''
      end
    end
  end
  if substring_length > max_substring_length
    max_substring_length = substring_length
    max_substring = substring
  end
  i += 1
end
puts max_substring
