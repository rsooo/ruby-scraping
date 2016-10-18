
require 'bundler'
Bundler.require

require 'capybara/poltergeist'

TARGET_URL = "http://tabelog.com/saitama/A1106/A110601/11000651/"
USER_AGENT = "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36"

Capybara.register_driver :poltergeist do |app|
  driver = Capybara::Poltergeist::Driver.new(app, {:js_errors => false, :timeout => 1000 , :headers => {'HTTP_USER_AGENT' => USER_AGENT, 'HTTP_ACCEPT_LANGUAGE' => 'ja,en-US;q=0.8,en;q=0.6'}})
#  binding.pry
  driver.headers =  {'User_Agent' => USER_AGENT, 'Accept_Language' => 'ja,en-US;q=0.8,en;q=0.6'}
  driver
end

session = Capybara::Session.new(:poltergeist)
session.visit (TARGET_URL)

#puts session.html
doc = Nokogiri::HTML.parse(session.html)

puts doc.search('title').inner_text

puts doc.search('#rstdata-wrap > table:nth-child(2) > tbody > tr.address > td > p').inner_text

#binding.pry

#tpic1
