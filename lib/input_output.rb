
class InputOutput
    def initialize(input,output)
        @input = input
        @output = output
    end

    def contacts_list
        @output.puts "View a contact:\nWhich contact would you like to view?"
        ContactsDisplay::DUMMY_CONTACTS.each do |key|
            @output.puts "#{key[:first_name]} #{key[:last_name]}"
        end 
    end

    def data_input_output_view
        #if @input.gets.to_i.is_a?Integer and @input != 0
            @output.puts  Read.new(@input.gets.to_i).fetch_contact
        else   
            @output.puts "main page"
        end 
    end
