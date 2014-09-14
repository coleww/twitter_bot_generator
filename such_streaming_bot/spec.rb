#!/usr/bin/env ruby
require_relative 'src/such_streaming_bot'

puts "hello world! ?"
puts SuchStreamingBot.matches? "hello world!"
puts "hello canada! ?"
puts SuchStreamingBot.matches? "hello canada!"
puts "replace this with meaningful example strings to test yr app!"
puts SuchStreamingBot.matches? "replace this with meaningful example strings to test yr app!"
