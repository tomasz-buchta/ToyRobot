require 'rspec'

describe TOYROBOT::Main do
  describe '#parse_cmd' do
    let(:main) {TOYROBOT::Main.new}

    describe 'when PLACE' do
      before(:each) {@robot = main.instance_variable_get(:@robot)}
      it 'should call the place with appropriate arguments' do
        expect(@robot).to receive(:place).with({x:0,y:0,heading:'NORTH'})
        main.parse_cmd('PLACE 0,0,NORTH')
      end
      describe 'without valid params' do
        it 'should not call the place' do
          expect(@robot).to_not receive(:place)
          main.parse_cmd('PLACE 0,NORTH')
        end
      end
    end

    describe 'when ROTATE' do
      it 'should call the rotate with RIGHT' do
        expect(main.instance_variable_get(:@robot)).to receive(:rotate).with('RIGHT')
        main.parse_cmd('RIGHT')
      end

      it 'should call the rotate with LEFT' do
        expect(main.instance_variable_get(:@robot)).to receive(:rotate).with('LEFT')
        main.parse_cmd('LEFT')
      end

      it 'should not call rotate' do
        expect(main.instance_variable_get(:@robot)).to_not receive(:rotate)
        main.parse_cmd('CENTER')
      end
    end

    describe 'when MOVE' do
      it 'should call move' do
        expect(main.instance_variable_get(:@robot)).to receive(:move)
        main.parse_cmd('MOVE')
      end
    end
  end
end