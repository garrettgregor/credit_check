require './lib/credit_check'

describe CreditCheck do
  VALID = %w[5541808923795240 4024007136512380 6011797668867828]
  LIMIT = 1500
  INVALID = %w[5541801923795240 4024007106512380 6011797668868728]

  describe "valid credit cards" do
    it "checks to see if a credit card is valid" do
      VALID.each do |card|
        credit_check = CreditCheck.new(card, LIMIT)
        expect(credit_check).to be_a(CreditCheck)
        expect(credit_check.card_number).to eq(card)
        expect(credit_check.limit).to eq(LIMIT)
        expect(credit_check.last_four).to eq(card[-4..])
        expect(credit_check.is_valid?).to eq(true)
      end
    end
  end

  describe "invalid credit cards" do
    it "checks to see if a credit card is invalid" do
      INVALID.each do |card|
        credit_check = CreditCheck.new(card, LIMIT)
        expect(credit_check).to be_a(CreditCheck)
        expect(credit_check.card_number).to eq(card)
        expect(credit_check.limit).to eq(LIMIT)
        expect(credit_check.last_four).to eq(card[-4..])
        expect(credit_check.is_valid?).to eq(false)
      end
    end
  end
end