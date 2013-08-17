require 'spec_helper'


describe Sandwich do

	describe '#initialize' do

		it { should have_and_belong_to_many(:items) }

	end


	describe '#send_email' do
		let(:sandwich) { Sandwich.create(:sender => 'wilwizard4@gmail.com',
																			:receiver => 'wilwizard4@gmail.com')}

		it "returns false" do
			expect(sandwich.send_email('password')).to be false
		end

		it "doesn't return false" do
			expect(sandwich.send_email('GrnMchn8')).not_to be false
		end
	end

end