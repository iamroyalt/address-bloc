#needs to connect with address_book
require_relative '../models/address_book'

Class MenuController
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
#Assignment 20 adding menu option View entry n
     puts "5 - View entry n"
     puts "6 - Exit"
     print "Enter your selection: "
# user input using "gets" which reads the next line from standard input
     selection = gets.to_i
     puts "You picked #{selection}"
  end
end
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
#Assignment 20 - adding entry_n_submenu since they will need to choose the entry
     when 5
       system "clear"
        entry_n_submenu
        main_menu
#changed exit option to 6 from 5
     when 6
       puts "Good-bye!"
#terminates the program using 0 which signals the program to exit without error
       exit(0)
 #use else to catch invalid user input and prompt the user to retry
     else
       system "clear"
       puts "Sorry, that is not a valid input"
       main_menu
     end
   end
#Assingment 20 Entry_n_submenu method
  def Entry_n_submenu
    puts "Entry number to view:"
#using gets.chomp.to_i as done on line 21
    selection = gets.chomp.to_i
#using count because the selection they make has to be in the AddressBook
    if selection < @address_book.entries.count
#if entry is there is puts to the screen
        puts @address_book.entries[selection]
        puts "Press enter to return to main menu"
        system "clear"
#if entry is not there it asks user to enter another selection
    else
      puts "#{selection} is not in AddressBook"
      Entry_n_submenu
    end
  end  


   def view_all_entries
     address_book.entries.each do |entry|
       system "clear"
       puts entry.to_s
#displays a submenu for each entry
       entry_submenu(entry)
     end
#submenu method
     def entry_submenu(entry)
#display the submenu options
         puts "n - next entry"
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
         when "e"
#return user to the main menu
         when "m"
           system "clear"
           main_menu
         else
           system "clear"
           puts "#{selection} is not a valid input"
           entry_submenu(entry)
         end
       end
     system "clear"
     puts "End of entries"
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
   end

   def search_entries
   end

   def read_csv
   end
 end

end
