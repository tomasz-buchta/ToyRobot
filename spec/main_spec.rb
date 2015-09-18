require 'rspec'

describe TOYROBOT::Main do
  describe '.parse_cmd' do

    describe 'PLACE' do
      let(:main) {TOYROBOT::Main.new}
      before(:each) {@robot = main.instance_variable_get(:@robot)}
      it 'should call the place method with appropriate arguments' do
        expect(@robot).to receive(:place).with({x:0,y:0,heading:'NORTH'})
        main.parse_cmd('PLACE 0,0,NORTH')
      end

      it 'should call the rotate' do
        expect(main.instance_variable_get(:@robot)).to receive(:rotate).with('RIGHT')
        main.parse_cmd('ROTATE RIGHT')
      end
    end
  end
end