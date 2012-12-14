$aapt = "/Users/luisleo/Programs/android/tool/aapt"

malname = ARGV[0]
malinfo = malname.split(".")[0] + ".info"
malperm = malname.split(".")[0] + ".perm"
malrecv = malname.split(".")[0] + ".recv"

p malinfo

cmd = "#{$aapt} l -a #{malname} > #{malinfo}"
`#{cmd}`    
cmd = "#{$aapt} d --values permissions #{malname} > #{malperm}"
`#{cmd}`

lines = File.readlines(malinfo)
receiver = File.open(malrecv, "w")
		     
flag = 0
lines.each do |line|
  if line.include?("E: receiver")
    flag = 1
    next
  end
  if flag == 0
    next
  end
  if line.include?("E: service")
    flag = 0
  end
  if line.include?("E: uses-sdk")
    flag = 0
  end
  if line.include?("E: uses-permission")
    flag = 0
  end
  if line.include?("E: activity")
    flag = 0
  end
  if line.include?("E: meta-data")
    flag = 0
  end
  if flag == 1
    if line.include?("android:name")
      str = line.split('"')
      receiver.write("\n"+str[str.size-2]+"\n")
    end
    if line.include?("E: intent-filter")
      flag = 2
      next
    end
  end
  if flag == 2
    if line.include?("android:name")
      str = line.split('"')
      receiver.write(str[str.size-2]+"\n")
    end
  end
end 
