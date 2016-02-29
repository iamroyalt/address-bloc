#test created to confirm AddressBook responds to Entries
require_relative '../models/address_book'
##feb 29 changes
 RSpec.describe AddressBook do
   context "attributes" do

     it "responds to entries" do
       book = AddressBook.new
       expect(book).to respond_to(:entries)
     end
#Tests that AddressBook initializes an empty array to be used
   end
   it "initializes entries as an array" do
         book = AddressBook.new
         expect(book.entries).to be_an(Array)
       end

       it "initializes entries as empty" do
         book = AddressBook.new
         expect(book.entries.size).to eq(0)
       end
     end
#makes the array of entry useful because entries can be added, definining expected
#behavior of array
     context "#add_entry" do
#each test is in a separate context for organization
       it "adds only one entry to the address book" do
          book = AddressBook.new
          book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')

          expect(book.entries.size).to eq(1)
      end
#Included multiple expects, if any fail, the entire it test will fail
       it "adds the correct information to entries" do
          book = AddressBook.new
          book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
          new_entry = book.entries[0]

          expect(new_entry.name).to eq('Ada Lovelace')
          expect(new_entry.phone_number).to eq('010.012.1815')
          expect(new_entry.email).to eq('augusta.king@lovelace.com')
          end
        end
#Assignment-19
#tests to determine entry to be removed
    context "remove_entry" do
      it "removes entry from address book" do
          book = AddressBook.new
          book.add_entry('Tracy Royal', '555.555.5555', 'tracyroyal@mac.com')

          name = "Ada Lovelace"
          phone_number = "010.012.1815"
          email_address = "augusta.king@lovelace.com"
          book.add_entry(name, phone_number, email_address)

          expect(book.entries.size).to eq 2
          book.remove_entry(name, phone_number, email_address)
#confirms only one entry in book and name of entry remaining
          expect(book.entries.size).to eq 1
          expect(book.entries.first.name).to eq ("Tracy Royal")
      end


 end
