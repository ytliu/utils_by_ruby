
$basedir = "/Users/luisleo/Programs/android/malware/samples"
$workdir = "/Users/luisleo/Programs/android/malware/samples-unzip"
$printer = "/Users/luisleo/Programs/android/tool/jar-file/AXMLPrinter2.jar"

def unzip_apk
  # delete all files in samples-unzip
  `rm -rf #{$workdir}/*`

  # get all malware families
  Dir.chdir($basedir) 
  malwareFamilies = Dir.glob("*")

  malwareFamilies.each do |family|
    # get all malwares for each family
    malwares = Dir.new(family).entries
    famdir = $workdir + "/" + family
    Dir.mkdir(famdir)
    malwares.each do |malware|
      if malware.eql?('.') || malware.eql?('..')
        next
      end
      # copy each malware apk to a new file
      malname = $basedir + "/" + family + "/" + malware
      puts malname
      maldir = $workdir + "/" + family + "/" + malware[0..6]
      puts maldir
      Dir.mkdir(maldir)
      cmd = "unzip #{malname} -d #{maldir}"
      `#{cmd}`
    end
  end
end

def decrypt_manifest
  Dir.chdir($workdir)
  
  malwareFamilies = Dir.glob("*")
  malwareFamilies.each do |family|
    # get all malwares for each family
    malwares = Dir.new(family).entries
    malwares.each do |malware|
      if malware.eql?('.') || malware.eql?('..')
        next
      end
      # decrypt AndroidManifest.xml
      mani_ori = $workdir + "/" + family + "/" + malware + "/AndroidManifest.xml"
      mani_tar = $workdir + "/" + family + "/" + malware + "/AndroidManifest-d.xml"
      cmd = "java -jar #{$printer} #{mani_ori} > #{mani_tar}"
      `#{cmd}`
    end
  end
end

if ARGV[0] == "unzip":
  unzip_apk
else if ARGV[0] == "decrypt"
  decrypt_manifest
end
