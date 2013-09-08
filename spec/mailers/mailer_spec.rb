require "spec_helper"

describe Mailer do

	describe '#send' do
		let(:sandwich) { Sandwich.create(:sender => 'wilwizard4@gmail.com',
																			:receiver => 'wilwizard4@gmail.com')}
		
		it "returns with false incorrect password" do
			expect(Mailer.send(sandwich, 'password')).to be false
		end

		it "doesn't return false with correct password" do
			expect(Mailer.send(sandwich, 'GrnMchn8')).not_to be false
		end
	end
end
