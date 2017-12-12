require "./bank_account"

RSpec.describe BankAccount do
  before :each do
  	@account = BankAccount.new(10)
  end
  
  describe "存錢功能" do
    it "餘額10元，存5元，餘額15" do
      @account.deposit 5
      expect(@account.balance).to be 15
    end

	it "餘額10元，存-5元，餘額10" do
	  account = BankAccount.new(10)
	  account.deposit -5
	  expect(account.balance).to be 10
	end
  end

  describe "領錢功能" do
    it "餘額10元，領5元，餘額5" do
      amount = @account.withdraw 5
      expect(amount).to be 5
      expect(@account.balance).to be 5
    end

    it "餘額10元，領20元，餘額10" do
      account = BankAccount.new(10)
      amount = account.withdraw(20)
      expect(amount).to be 0
      expect(account.balance).to be 10
    end

    it "餘額10元，領-5元，餘額10" do
      account = BankAccount.new(10)
      amount = account.withdraw(-5)
      expect(amount).to be 0
      expect(account.balance).to be 10
    end
  end
end