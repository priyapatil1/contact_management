class Read
    def initialize(contacts,input)
        @contacts = contacts
        @input = input
    end

    def fetch_contact
        contact_id = @input.to_i
        return @contacts[contact_id-1] 
    end
end
