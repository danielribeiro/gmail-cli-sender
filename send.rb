require 'net/smtp'

FROM_EMAIL = "yourname@example.com"
FROM = "Your Name <#{FROM_EMAIL}>"
PASSWORD = "YOURPASSWORD"


def send_email(subject, body, email, aliasto)
    message = <<EOF
From: #{FROM}
To: #{aliasto} <#{email}>
Subject: #{subject}
#{body}
EOF
    puts "Sending email..."
    smtp = Net::SMTP.new('smtp.gmail.com', 587 )
    smtp.enable_starttls
    smtp.start('gmail.com', FROM_EMAIL, PASSWORD, :plain) do |smtp|
        smtp.send_message message, FROM_EMAIL, email
    end
    puts "Done"
end

# Sample usage
body = <<EOF
Hi,

A real email body here

Cheers,
- Your command line
EOF
send_email "from cli", body, "yourfriendname@example.com", "Your Friend"