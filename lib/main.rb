require 'pry'
require 'require_all'
require_all 'lib'

module TOYROBOT
  class Main

    def initialize
      @robot = TOYROBOT::Robot.new
    end

    def parse_cmd(input)
      directions = %w[NORTH EAST SOUTH WEST]
      cmd = input.split(' ')[0]

      case cmd
        when 'PLACE'
          begin
            args = input.split(' ')[1].split(',')
            x = Integer(args[0])
            y = Integer(args[1])
            throw ArgumentError unless directions.include? args[2].upcase
            position = {x: x,y: y, heading: args[2]}
            @robot.place(position)
          rescue ArgumentError
            puts 'Wrong argument'
          end
        when 'LEFT','RIGHT'
          begin
            raise ArgumentError unless  %w[RIGHT LEFT].include? cmd
            @robot.rotate(cmd)
          rescue ArgumentError
            puts 'Wrong argument'
          end
        when 'MOVE'
          @robot.move
        else
      end
    end
  end
end
