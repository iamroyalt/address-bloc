#needs to connect with address_book
require_relative '../models/address_book'

class MenuController
  attr_reader :address_book

  def initialize
    @address_book = AddressBook.new
  end
#display the main menu options to the command line
  def main_menu
     puts "Main Menu - #{address_book.entries.count} entries"
     puts "1 - View all entries"
     puts "2 - Create an entry"
     puts "3 - Search for an entry"
     puts "4 - Import entries from a CSV"
     puts "5 - Exit"
     print "Enter your selection: "
# user input using "gets" which reads the next line from standard input
     selection = gets.to_i
#use case statement operator to determine the proper response
     case selection
     when 1
       system "clear"
       view_all_entries
       main_menu
     when 2
       system "clear"
       create_entry
       main_menu
     when 3
       system "clear"
       search_entries
       main_menu
     when 4
       system "clear"
       read_csv
       main_menu
     when 5
       puts "Good-bye!"
#terminates the program using 0 which signals the program to exit without error
       exit(0)
 #use else to catch invalid user input and prompt the user to retry
     else
       system "clear"
       puts "Sorry, that is not a valid input"
       main_menu
  end


#iterates through all the entries using each
   def view_all_entries
     address_book.entries.each do |entry|
       system "clear"
       puts entry.to_s
#displays a submenu for each entry
       entry_submenu(entry)
     end

     system "clear"
     puts "End of entries"
     end
#submenu method
     def entry_submenu(entry)
#display the submenu options
         puts "\nn - next entry"
         puts "d - delete entry"
         puts "e - edit this entry"
         puts "m - return to main menu"

#chomp removes any trailing whitespace from the string gets return     # #17
         selection = gets.chomp

         case selection
#when user asks to see the next entry, we can do nothing and control will be
##returned to view_all_entries
         when "n"
#handles deleting and editing
         when "d"
           delete_entry(entry)
         when "e"
           edit_entry(entry)
           entry_submenu(entry)
         when "m"
           system "clear"
           main_menu
         else
           system "clear"
           puts "#{selection} is not a valid input"
           entry_submenu(entry)
         end
       end

   end


   def create_entry
#clear the screen before displaying any prompts
     system "clear"
     puts "New AddressBloc Entry"
#use print to prompt the user for each entry
     print "Name: "
     name = gets.chomp
     print "Phone number: "
     phone = gets.chomp
     print "Email: "
     email = gets.chomp
#uses add_entry to ensure the new entry is added in the proper order
     address_book.add_entry(name, phone, email)

     system "clear"
     puts "New entry created"
   end

   def read_csv
     print "Enter CSV file to import:"
     file_name = gets.chomp

     if file_name.empty?
       system "clear"
       puts "No CSV file read"
       main_menu
     end

     begin
       entry_count = address_book.import_from_csv(file_name).count
       system "clear"
        puts "#{entry_count}"
    rescue
       puts "#{file_name} is not a valid CSV file, please enter the name of another CSV file"
       read_csv
    end
  end

   def delete_entry(entry)
     address_book.entries.delete(entry)
     puts "#{entry.name} has been deleted"
   end

   def edit_entry(entry)
     print "Updated name: "
     name = gets.chomp
     print "Updated phone number: "
     name = gets.chomp
     print "Updated email: "
     email = gets.chomp

     entry.name = name if !name.empty?
     entry.phone_number = phone_number if !phone_number.empty?
     entry.email = email if !email.empty?
     system "clear"

     puts "Updated entry: "
     puts entry
   end

   def search_entries
     print "Search by name: "
     name = gets.chomp

     match = address_book.binary_search(name)
     system "clear"

     if match
       puts match.to_s
       search_submenu(match)
     else
       puts "No match found for #{name}"
     end
   end

   def search_submenu(entry)
     puts "\nd - delete entry"
     puts "e - edit this entry"
     puts "m - return to main menu"

     selection = gets.chomp

     case selection
      when "d"
        system "clear"
        delete_entry(entry)
        main_menu
      when "e"
        edit_entry(entry)
        system "clear"
        main_menu
      when "m"
        system "clear"
        main_menu
      else
        system "clear"
        puts "#{selection} is not a valid input"
        puts entry.to_s
        search_submenu(entry)
      end
end
