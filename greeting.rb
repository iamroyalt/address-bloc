greeting = ARGV[0]

ARGV.each_with_index do |name, idx|
  puts "#{greeting} #{name}" if idx>0

end  
