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
end