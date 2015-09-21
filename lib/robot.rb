module TOYROBOT
  class Robot
    attr_reader :position
    def initialize
      @directions = %w[NORTH EAST SOUTH WEST]
    end
    def place(position)
      @position = position
    end

    def report
      "#{@position[:x]} #{@position[:x]} #{@position[:heading]}"
    end

    def rotate(direction)
      case direction
        when 'RIGHT'
          @position[:heading] = @directions[@directions.find_index(@position[:heading]) + 1]
        when 'LEFT'
          @position[:heading] = @directions[@directions.find_index(@position[:heading]) - 1]
        else
      end
    end

    def move
      old_position = @position
      case @position[:heading]
        when 'NORTH'
          @position[:y] = old_position[:y] + 1
        when 'SOUTH'
          @position[:y] = old_position[:y] - 1
        when 'EAST'
          @position[:x] = old_position[:x] + 1
        when 'WEST'
          @position[:x] = old_position[:x] - 1
        else
      end
    end
  end
end
