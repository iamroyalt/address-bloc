   require_relative '../models/entry'
 #1 says the file is a spec file and that it tests Entry
    Rspec.describe Entry do
#to keep Rspec DRY define efficient helper methods using let, don't have to
#create an entry local variable within each test, just define it once
   let(:entry) { Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com') }
 end
#2 tells us the specs in this context will test Entry attributes
  Context "attributes" do
#3 separates individual tests. Each it respresents a unique test
   it "responds to name" do
#test set up to assume entries will always be created with values for name, etc.
#entry = Entry.new ('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
#4 each Rspec test ends with one or more expect method, used to declare
#the expectations for the test. If expectations are met, the test passes
#if not, it fails
     expect(entry).to respond_to(:name)
     it "reports its name" do
#entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
       expect(entry.name).to eq('Ada Lovelace')
     end

  end
  it "responds to phone number" do
#entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
    expect(entry).to respond_to (:phone_number)
 end
    it "reports its phone_number" do
#entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
       expect(entry.phone_number).to eq('010.012.1815')
     end
     it "responds to email" do
#entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
       expect(entry).to respond_to (:email)
     end
     it "reports its email" do
#entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
       expect(entry.email).to eq('augusta.king@lovelace.com')
     end
#use a new context to separate the to_s test from the initializer tests.
#The # in front of to_s indicates that it is an instance method.
     describe "#to_s" do
     it "prints an entry as a string" do
       entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
       expected_string = "Name: Ada Lovelace\nPhone Number: 010.012.1815\nEmail: augusta.king@lovelace.com"
#use eq to check that to_s returns a string equal to expected_string
       expect(entry.to_s).to eq(expected_string)
     end





   end
end
