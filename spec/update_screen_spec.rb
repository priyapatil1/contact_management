require "dummy_contacts_display"
require "update"
require "update_screen"

describe UpdateScreen  do 
    before do
        @contacts = ContactsDisplay::DUMMY_CONTACTS
    end

    it "updates a dummy contact display with the new details a user enters" do 
        input = StringIO.new("3\nAlex\nJones")
        output = StringIO.new("")
        UpdateScreen.new(@contacts,input,output).show
        expect(output.string).to include("Alex")
    end
end
