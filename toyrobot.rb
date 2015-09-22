require_relative 'lib/main'

main = TOYROBOT::Main.new

cmd = ''
while cmd != 'quit'
  puts 'Input command'
  cmd = gets
  puts main.parse_cmd(cmd)
end