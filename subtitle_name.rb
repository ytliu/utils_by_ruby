curdir = `pwd`.strip
p "curdir is #{curdir}"
Dir.chdir(curdir)

m4v_names = Dir.glob("*.m4v").map(&:downcase).sort!
st_names = Dir.glob("*.ass").map(&:downcase).sort!

for i in 0..m4v_names.size-1 do
  ori_name = st_names[i]
  dst_name = m4v_names[i].split(".m4v")[0] + ".ass"
  p "change #{ori_name} to #{dst_name}"
  File.rename(st_names[i], m4v_names[i].split(".m4v")[0] + ".ass")
end

