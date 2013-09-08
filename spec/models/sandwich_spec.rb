require 'spec_helper'


describe Sandwich do

	describe '#initialize' do

		it { should have_and_belong_to_many(:items) }

	end
end

