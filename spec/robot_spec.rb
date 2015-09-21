require 'rspec'

describe TOYROBOT::Robot do

  let(:robot) {TOYROBOT::Robot.new}

  describe '#place' do
    it 'should place the robot' do
      robot.place({x:0,y:0,heading:'NORTH'})
      expect(robot.position).to eq({x:0,y:0,heading:'NORTH'})
    end

    it 'should not place robot outside of table' do
      expect{robot.place({x:-1,y:0,heading:'NORTH'})}.to_not change{robot.position}
    end
  end

  describe '#rotate' do
    before(:each) do
      robot.place({x:0,y:0,heading:'NORTH'})
    end
    it 'should rotate RIGHT from NORTH to EAST' do
      expect{robot.rotate('RIGHT')}.to change{robot.position[:heading]}.from('NORTH').to('EAST')
    end

    it 'should rotate LEFT from NORTH to WEST' do
      expect{robot.rotate('LEFT')}.to change{robot.position[:heading]}.from('NORTH').to('WEST')
    end
  end

  describe '#report' do
    before(:each) do
      robot.place({x:0,y:0,heading:'NORTH'})
    end
    it 'should report correct position' do
      expect(robot.report).to eq('0 0 NORTH')
    end
  end

  describe '#move' do
    it 'should move NORTH' do
      robot.place({x:1,y:1,heading:'NORTH'})
      robot.move
      expect(robot.position).to eq({x:1,y:2,heading:'NORTH'})
    end

    it 'should move SOUTH' do
      robot.place({x:1,y:1,heading:'SOUTH'})
      robot.move
      expect(robot.position).to eq({x:1,y:0,heading:'SOUTH'})
    end

    it 'should move EAST' do
      robot.place({x:1,y:1,heading:'EAST'})
      robot.move
      expect(robot.position).to eq({x:2,y:1,heading:'EAST'})
    end

    it 'should move WEST' do
      robot.place({x:1,y:1,heading:'WEST'})
      robot.move
      expect(robot.position).to eq({x:0,y:1,heading:'WEST'})
    end

    it 'should not move out of board' do
      robot.place({x:4,y:4,heading:'NORTH'})
      expect{robot.move}.to_not change{robot.position[:y]}
    end

    it 'should not move out of board' do
      robot.place({x:4,y:4,heading:'EAST'})
      expect{robot.move}.to_not change{robot.position[:x]}
    end

    it 'should not move out of board' do
      robot.place({x:0,y:0,heading:'SOUTH'})
      expect{robot.move}.to_not change{robot.position[:y]}
    end

    it 'should not move out of board' do
      robot.place({x:0,y:0,heading:'WEST'})
      expect{robot.move}.to_not change{robot.position[:x]}
    end

    describe 'private' do
      describe '#in_bounds?' do

        it 'should be true for valid lower bound position' do
          expect(robot.send(:in_bounds?,{x:0,y:0,heading:'NORTH'})).to be(true)
        end

        it 'should be true for valid upper bound position' do
          expect(robot.send(:in_bounds?,{x:4,y:4,heading:'NORTH'})).to be(true)
        end

        it 'should be false for x < 0' do
          expect(robot.send(:in_bounds?,{x:-1,y:2,heading:'NORTH'})).to be(false)
        end

        it 'should be false for x > 4' do
          expect(robot.send(:in_bounds?,{x:5,y:2,heading:'NORTH'})).to be(false)
        end

        it 'should be false for y < 0' do
          expect(robot.send(:in_bounds?,{x:1,y:-1,heading:'NORTH'})).to be(false)
        end

        it 'should be false for x < 4' do
          expect(robot.send(:in_bounds?,{x:1,y:5,heading:'NORTH'})).to be(false)
        end

      end
    end

  end
end