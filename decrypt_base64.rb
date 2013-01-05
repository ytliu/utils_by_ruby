# decrypt str encoded by base64
# ARGV[0] translate command (0 for string, 1 for file)
# ARGV[1] translate string or file
# ARGV[2] my_base64chars if exist


require 'base64'

BEGIN { puts "Hello!\n" }

cmd = ARGV[0].to_i

if ARGV.size < 2
	puts "Usage: ruby #{$0} [0|1] [str|file] [base64chars]"
	exit
end

if cmd == 0
	s = ARGV[1]
elsif cmd == 1
	f = ARGV[1]
	s = File.read(f)
end

puts "\ntranslate string is:\n#{s}"

std_base64chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/="

if (ARGV[2] != nil) and (ARGV[2].size >= 65)
	my_base64chars = ARGV[2]
else
	my_base64chars  = "STvJjktoVFZ9f0PGlicqy3xK7zH8ruXdn5WwDRIeb1UmEgOhYs2NpLC4QBa6AM+/_"
end

puts "\ntranslate str according to #{my_base64chars}"

s = s.tr(my_base64chars, std_base64chars)

data = Base64.decode64(s)
puts "\ntranslated str is #{data}\n"

END { puts "\nBye!" }

