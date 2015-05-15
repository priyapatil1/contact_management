module ContactsDisplay
    DUMMY_CONTACTS = 
        [{:first_name => "Anna", :last_name => "Smith", :dob => "10.03.1989",:address => "12 Forlease Road",:postcode => "SW9 0LG"},

            {:first_name => "Bob", :last_name => "Smith", :dob => "02.12.1988", :address => "10 Cedars Road",:postcode => "KT11 1RY"},

            {:first_name => "Emma", :last_name => "Jones", :dob => "12.08.1997", :address => "11 Emerald Road", :postcode => "EC1Y SXY"},

            {:first_name => "Sam", :last_name => "Smith", :dob => "01.11.1976", :address => "03 Hatton Garden", :postcode => "EC1R 6JP"}] 
end

class UserMainScreenChoice
    def initialize(input)
        @input = input
    end

    def user_choice
        if @input == 1
            return  "create a contact"
        end
    end
end

class Read
    def initialize(contact_id)
        @contact_id = contact_id
    end
    def fetch_contact
        ContactsDisplay::DUMMY_CONTACTS[@contact_id-1].each do |key,value|
            puts "#{key} : #{value}"
        end
    end
end

class Create 
    def initialize(first_name,last_name,dob,address,postcode)
        @first_name = first_name
        @last_name = last_name
        @dob = dob
        @address = address
        @postcode = postcode
    end

    def add_contact
        ContactsDisplay::DUMMY_CONTACTS << {:first_name => "#{@first_name}, :last_name => #{@last_name}",:dob => "#{@dob}", :address => "#{@address}", :postcode => "#{@postcode}"}
    end

end

class Update
    def initialize(first_name,last_name,input)
        @input = input
        @first_name = first_name
        @last_name = last_name
    end
    def update
        new_values = {:first_name => "#{@first_name}"}
        Read.new(@input).fetch_contact.merge!(new_values){|key,v1,v2|v2}
    end
end

class Delete
    def initialize(id,input)
        @id = id
        @input = input
    end
    def remove_contact
        if @input == "Y"
            contact_hash = Read.new(@id).fetch_contact
            contact_hash.each do |key,value|
                contact_hash.delete(key,value)
            end
            @input == "N"
            return ContactsDisplay::DUMMY_CONTACTS
        end
    end
end

class InputOutput
    def initialize(input,output)
        @input = input
        @output = output
    end

    def main_screen
        @output.puts "What would you like to do?\n1) Create a new contact\n2) View a contact\n3) Update a contact\n4) Delete a contact\n\nEnter your choice:"
    end
    def user_choice
        if @input.gets.to_i == 1
            @output.puts Create.new
    end
    end
    def contacts_list
        @output.puts "View a contact:\nWhich contact would you like to view?"
        ContactsDisplay::DUMMY_CONTACTS.each do |contact|
            @output.puts "#{contact[:first_name]} #{contact[:last_name]}"
        end 
    end

    def data_input_output_view
        #if @input.gets.to_i.is_a?Integer and @input != 0
        @output.puts Read.new(@input.gets.to_i).fetch_contact
        #else   
        @output.puts "main page"
        #end 
    end

    def create_contact
        @output.puts Create.new(@input).add_contact
    end

    def start
        main_screen
        contacts_list
        data_input_output_view
    end
end









