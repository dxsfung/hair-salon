require('spec_helper')

describe(Client) do
    describe(".all") do
        it("starts off with no clients") do
            expect(Client.all()).to(eq([]))
        end
    end

    describe("#name") do
        it("tells you its name") do
            client = Client.new({:name => "David Storemanager", :id => nil})
            expect(client.name()).to(eq("David Storemanager"))
        end
    end

    describe("#stylist_id") do
        it("lets you read the stylist ID out") do
            test_client = Client.new({:name => "Superman", :stylist_id => 999})
            expect(test_client.stylist_id()).to(eq(999))
        end
    end

    # describe("#save") do
    #     it("adds a client to the array of saved client") do
    #         test_client = Client.new({:name => "Special Client", :stylist_id=>1})
    #         test_client.save()
    #         expect(Client.all()).to(eq([test_client]))
    #     end
    # end


    describe("#==") do
        it("is the same client if it has the same name") do
            client1 = Client.new({:name => "David Storemanager", :id => nil})
            client2 = Client.new({:name => "David Storemanager", :id => nil})
            expect(client1).to(eq(client2))
        end
    end

    # describe("#delete") do
    #     it("lets you delete a client from the database") do
    #         client = Client.new({:name => "Client TheGreat", :id => nil})
    #         client.save()
    #         client2 = Client.new({:name => "Client TheSuper", :id => nil})
    #         client2.save()
    #         client.delete()
    #         expect(Client.all()).to(eq([client2]))
    #     end
    # end

end
