utils_by_ruby
=============

some utilities/tools using ruby language

------

#####apk_2_info.rb:
    
get receiver/permission information from file processed by aapt tool on apk file

    $ ./apk_2_info.rb apkname

------

#####subtitle_name.rb:
    
batch modify subtitle filename according to the audio/video filename
    
    $ ./subtitle_name.rb

------

#####parseApk.rb:

batch unzip apk, decrypt manifest for the apk file
    
    $ ./parseApk.rb [unzip|decrypt]

####decrypt_base64.rb:

decrypt string encoded by Base64 schemes

    $ ./decrypt_base64.rb [0|1] [str|file] [base64chars]

####sendgmail.rb:

sendgmail according to filename

    $ ruby sendgmail pws filename
