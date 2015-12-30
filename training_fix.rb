h = {}
File.open("training.txt", "r").each_line do |l|
  chars = l.split("")
  chars.each do |c|
    if h.has_key? c
      h[c] = h[c] + 1
    else
      h[c] = 1 if c.match(/\S/) && !c.empty?
    end
  end
end

words_finished = 0
line = ""

File.open("training-fixed.txt", "w") do |f|
  File.open("training.txt", "r").each_line do |l|
    words = l.split(" ")
    words.each do |w|
      remove = true
      temp_hash = h.clone
      if w.split("").count < 10
        w.split("").each do |c|
          if (temp_hash[c] <= 10)
            remove = false
            break
          else
            temp_hash[c] = temp_hash[c] - 1
          end
        end
      else
        remove = false
      end

      if !remove
        line << w + " "
        words_finished = words_finished + 1
        puts line
      else
        h = temp_hash
      end

      if !line.strip.empty? && words_finished >= 7
        f.puts(line)
        words_finished = 0
        line = ""
      end
    end
  end
end

print h.inspect
