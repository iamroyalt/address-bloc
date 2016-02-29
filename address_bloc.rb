require_relative 'controllers/menu_controller'

#creates a new MenuController when AddressBloc starts
 menu = MenuController.new
#clears the command line
 system "clear"
 puts "Welcome to AddressBloc!"
#displays the menu
menu.main_menu

end
