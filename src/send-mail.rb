#!/usr/bin/env ruby

require 'gmail'

def send_mail
  Gmail.connect!(get_username, get_password) do |gmail|
    log_mail get_to, get_subject, get_body
    gmail.deliver! do
      to get_to
      subject get_subject
      body get_body
    end
    puts "Sent!!!"
  end if isValid
end

def isValid
  isEnvAbsent = get_username.nil? || get_password.nil? || get_to.nil?
  puts "Error: Environment variables absent" if isEnvAbsent

  isContentAbsent = get_subject.nil? || get_body.nil?
  puts "Error: Content missing" if isContentAbsent

  !isEnvAbsent && !isContentAbsent
end

def log_mail(to, subject, body)
  puts "Sending mail to #{to} with subject (#{subject}) and body (#{body})"
end

def get_username
  ENV['AUTOMATION_EMAIL']
end

def get_password
  ENV['AUTOMATION_PASSWORD']
end

def get_to
  ENV['AUTOMATION_TO']
end

def get_subject
  ARGV[0]
end

def get_body
  ARGV[1] || STDIN.read
end

send_mail if __FILE__ == $0
