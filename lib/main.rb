require 'pry'
require 'require_all'
require_all 'lib'

module TOYROBOT
  TABLE_DIMENSION = 5

  class Main

    def initialize
      @robot = TOYROBOT::Robot.new
    end

    def parse_cmd(input)
      directions = %w[NORTH EAST SOUTH WEST]
      cmd = input.split(' ')[0]
      args = input.split(' ')[1].split(',')
      case cmd
        when 'PLACE'
          begin
            x = Integer(args[0])
            y = Integer(args[1])
            throw ArgumentError unless directions.include? args[2].upcase
            position = {x: x,y: y, heading: args[2]}
            @robot.place(position)
          rescue ArgumentError
            puts 'Wrong argument'
          end
        when 'ROTATE'
          begin
            throw ArgumentError unless  %w[RIGHT LEFT].include? args.first
            @robot.rotate(args.first)
          rescue ArgumentError
            puts 'Wrong argument'
          end
        else
      end
    end
  end
end
