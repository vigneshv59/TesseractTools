require 'unicode'

included_words = []
files = ["tyv.bible.ibt.txt", "tyv.something.txt", "tyv.shyn.20150416.txt"]
files.each do |file_name|
  File.open(file_name, "r").each_line do |l|
    words = l.split(" ")
    line = ""
    words.each do |w|
      next if w.strip.empty?
      result = w.gsub(/\A[^\p{Cyrillic}]+|[^\p{Cyrillic}]+\Z/, '')
      result = result.strip
      result = Unicode::downcase(result)
      if result.match("[\p{Cyrillic}]").nil?
        included_words << result
      end
    end
  end
end

included_words.uniq!
File.open("wordlist.txt", "w") do |f|
  included_words.each do |i|
    f.puts(i)
  end
end
