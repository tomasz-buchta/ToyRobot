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
  end
end