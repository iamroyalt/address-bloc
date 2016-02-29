#feb 29 changes
#tells ruby to load the library entry.rb
require_relative 'entry'
#AddressBook needs an attribute to hold the array of entries. The entries
#array will store entries. Provides an easy way to add, remove and count entries
class AddressBook
   attr_reader :entries
#initializes entries array so it can be used
   def initialize
        @entries = []
   end

   def add_entry(name, phone_number, email)
#create a variable to store the insertion index
     index = 0
     entries.each do |entry|
#compare name with current name of entry
#if name proceeds entry.name, found index to insert it at, otherwise index is
#incremented and continue comparing other entries
       if name < entry.name
         break
       end
       index += 1
     end
#insert a new entry into entries using the calculated "index"
     entries.insert(index, Entry.new(name, phone_number, email))
     end

end
