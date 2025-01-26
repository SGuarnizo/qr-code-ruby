# Write your solution here!
require "rqrcode"

contador = 0

while contador < 1
  puts "What kind of QR code would you like to generate?"
  puts
  puts "1. Open a URL"
  puts "2. Join a wifi network"
  puts "3. Send a text message"
  puts
  puts "Press 4 to exit"

  user_loc = gets.chomp.to_i

  if user_loc == 1
    puts "What is the URL you would like to encode?"
    user_url = gets.chomp
    puts "What would you like to call the PNG?"
    url_name = gets.chomp
    qrcode = RQRCode::QRCode.new(user_url)
    png = qrcode.as_png({ :size => 500 })
    IO.binwrite("#{url_name}.png", png.to_s)
  elsif user_loc==2
    puts "What is the name of the wifi network?"
    user_wifi = gets.chomp
    puts "What is the password?"
    user_password = gets.chomp
    puts "What would you like to call the PNG?"
    url_name = gets.chomp
    user_url = "WIFI:T:WPA;S:#{user_wifi};P:#{user_password};;"
    qrcode = RQRCode::QRCode.new(user_url)
    png = qrcode.as_png({ :size => 500 })
    IO.binwrite("#{url_name}.png", png.to_s)
  elsif user_loc==3
    puts "What is the phone number you want the code to send a text message to?"
    phone = gets.chomp
    puts "What do you want to populate the message with?"
    txt_message = gets.chomp
    puts "What would you like to call the PNG?"
    url_name = gets.chomp
    user_url = "SMSTO:#{phone}:#{txt_message}"
    qrcode = RQRCode::QRCode.new(user_url)
    png = qrcode.as_png({ :size => 500 })
    IO.binwrite("#{url_name}.png", png.to_s)
  elsif user_loc==4
    contador = contador + 1
  else
    puts "Make sure to type a number between 1-4!"
  end

end
