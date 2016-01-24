require './results'

describe MyHash do
  subject(:hash) { MyHash.new }
  before { hash[1] = 8 }

  context "when not found" do
  	it { expect(hash[0]).to be_empty }
  end

  it "shoud return 8 when find first element" do
  	expect(hash[1]).to eq(8)
  end

  context "when hash's size equels 2" do
  	before { hash["axe"] = 12 }
  	it { hash.size == 2 }
  end

  it "shoud return false when hash isn't empty" do
  	expect(hash.empty?).to be false
  end

  context "when hash is empty" do
  	before { hash.clear }
  	RSpec::Matchers.define :clear_hash do
  	  match do |clean_hash|
  	    clean_hash.size == 0 && clean_hash.empty?
  	  end
  	end	
  end

  describe "the result of calling some key" do
  	before do
  	  hash["ter"] = 26
  	  hash["Corn"] = 33
  	end
  	it "shoud return Corn when third element exists" do
  	  expect(hash.keys[2]).to eq("Corn")
  	end
  end

  describe "the result of calling any value" do
    before do
      hash["ter"] = 26
      hash["Name"] = "Misha"
    end
    it "shoud return Misha when third element exists" do
      expect(hash.values[2]).to eq("Misha")
    end
  end
end