require 'rspec'

describe TOYROBOT::Robot do
  before(:each) do
    @robot = TOYROBOT::Robot.new
  end
  describe '#place' do
    it 'should place the robot' do
      @robot.place({x:0,y:0,heading:'NORTH'})
      expect(@robot.position).to eq({x:0,y:0,heading:'NORTH'})
    end
  end

  describe '#rotate' do
    before(:each) do
      @robot.place({x:0,y:0,heading:'NORTH'})
    end
    it 'should rotate RIGHT from NORTH to EAST' do
      expect{@robot.rotate('RIGHT')}.to change{@robot.position[:heading]}.from('NORTH').to('EAST')
    end

    it 'should rotate LEFT from NORTH to WEST' do
      expect{@robot.rotate('LEFT')}.to change{@robot.position[:heading]}.from('NORTH').to('WEST')
    end
  end

  describe '#report' do
    before(:each) do
      @robot.place({x:0,y:0,heading:'NORTH'})
    end
    it 'should report correct position' do
      expect(@robot.report).to eq('0 0 NORTH')
    end
  end

  describe '#Move' do
    it 'should move NORTH' do
      @robot.place({x:1,y:1,heading:'NORTH'})
      @robot.move
      expect(@robot.position).to eq({x:1,y:2,heading:'NORTH'})
    end

    it 'should move SOUTH' do
      @robot.place({x:1,y:1,heading:'SOUTH'})
      @robot.move
      expect(@robot.position).to eq({x:1,y:0,heading:'SOUTH'})
    end

    it 'should move EAST' do
      @robot.place({x:1,y:1,heading:'EAST'})
      @robot.move
      expect(@robot.position).to eq({x:2,y:1,heading:'EAST'})
    end

    it 'should move WEST' do
      @robot.place({x:1,y:1,heading:'WEST'})
      @robot.move
      expect(@robot.position).to eq({x:0,y:1,heading:'WEST'})
    end
  end
end