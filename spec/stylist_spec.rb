require('spec_helper')

describe(Stylist) do
    describe(".all") do
        it("starts off with no stylists") do
            expect(Stylist.all()).to(eq([]))
        end
    end

    describe("#name") do
        it("tells you the stylist's name") do
            stylist = Stylist.new({:name => "Stylist Thefirst", :id => nil})
            expect(stylist.name()).to(eq("Stylist Thefirst"))
        end
    end

    describe("#id") do
        it("sets its ID when you save it") do
            stylist = Stylist.new({:name => "Stylist Thefirst", :id => nil})
            stylist.save()
            expect(stylist.id()).to(be_an_instance_of(Fixnum))
        end
    end

    describe("#update") do
        it("lets you update stylists in the database") do
            stylist = Stylist.new({:name => "Stylist Eleven", :id => nil})
            stylist.save()
            stylist.update({:name => "Stylist Twelve"})
            expect(stylist.name()).to(eq("Stylist Twelve"))
        end
    end

    describe("#==") do
        it("is the same stylist if it has the same name") do
            stylist1 = Stylist.new({:name => "Stylist Thefirst", :id => nil})
            stylist2 = Stylist.new({:name => "Stylist Thefirst", :id => nil})
            expect(stylist1).to(eq(stylist2))
        end
    end

    describe(".find") do
        it("returns a stylist by its ID") do
            test_stylist = Stylist.new({:name => "Stylist Second", :id => nil})
            test_stylist.save()
            test_list2 = Stylist.new({:name => "Stylist Third", :id => nil})
            test_list2.save()
            expect(Stylist.find(test_list2.id())).to(eq(test_list2))
        end
    end

    describe("#clients") do
        it("returns an array of clients for that stylist") do
            test_stylist = Stylist.new({:name => "Stylist Thebest", :id => nil})
            test_stylist.save()
            test_client = Client.new({:name => "Client NumberOne", :stylist_id => test_stylist.id()})
            test_client.save()
            test_client2 = Client.new({:name => "Client NumberTwo", :stylist_id => test_stylist.id()})
            test_client2.save()
            expect(test_stylist.clients()).to(eq([test_client, test_client2]))
        end
    end

    describe("#delete") do
        it("lets you delete a stylist from the database") do
            stylist = Stylist.new({:name => "Stylist Super", :id => nil})
            stylist.save()
            stylist2 = Stylist.new({:name => "Stylist Tango", :id => nil})
            stylist2.save()
            stylist.delete()
            expect(Stylist.all()).to(eq([stylist2]))
        end
    end

    it("deleting stylist deletes all the stylist's clients from the database") do
        stylist = Stylist.new({:name => "Stylist TheExcellent", :id => nil})
        stylist.save()
        client = Client.new({:name => "Client Alpha", :stylist_id => stylist.id()})
        client.save()
        client2 = Client.new({:name => "Client Bravo", :stylist_id => stylist.id()})
        client2.save()
        stylist.delete()
        expect(Client.all()).to(eq([]))
    end

end
