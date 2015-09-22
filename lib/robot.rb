module TOYROBOT
  TABLE_SIZE = 4

  class Robot
    attr_reader :position

    def initialize
      @directions = %w[NORTH EAST SOUTH WEST]
    end

    def place(position)
      old_position = @position
      @position = position
      @position = old_position unless in_bounds?(@position)
    end

    def report
      return if @position.nil?
      "#{@position[:x]} #{@position[:y]} #{@position[:heading]}"
    end

    def rotate(direction)
      return if @position.nil?
      case direction
        when 'RIGHT'
          @position[:heading] = @directions[@directions.find_index(@position[:heading]) + 1]
        when 'LEFT'
          @position[:heading] = @directions[@directions.find_index(@position[:heading]) - 1]
        else
      end
    end

    def move
      return if @position.nil?
      old_position = @position.clone
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

      @position = old_position unless in_bounds? @position
    end

    private

    def in_bounds?(position)
      x = position[:x]
      y = position[:y]
      if x.between?(0,TABLE_SIZE) && y.between?(0,TABLE_SIZE)
        return true
      end
      false
    end
  end
end
