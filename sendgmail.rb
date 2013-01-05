require 'gmail'

def sendgmail(filename, username, password)
  Gmail.new(username, password) do |gmail|
    lines = IO.readlines(filename)
    lines.each do |line|
      to_mail = "#{line.split[0]}@fudan.edu.cn"
      score = line.split[1]
      tscore = format("%.2f", score.split('/').map(&:to_f).inject(0) { |a, e| a + e })
      content = "#{tscore} (summary/qa/discussion = #{score})"
      p "#{to_mail} #{content}"
      
      gmail.deliver do
       to to_mail
       subject 'rec2 score'
       text_part do
         body content
       end
     end
   end
 end
end

username = 'mctrain016@gmail.com'
password = ARGV[0]
filename = ARGV[1]

sendgmail(filename, username, password)
