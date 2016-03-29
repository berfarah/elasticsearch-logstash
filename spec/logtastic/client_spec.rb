require 'logtastic/client'

module Logtastic
  describe Client do
    subject = Client

    before { allow(Response).to receive(:new) }

    describe "#search" do
      it "defaults to a sort=@timestamp:desc" do
        client = Client.new

        expect(client.client).to receive(:search).with(sort: "@timestamp:desc")
        client.search
      end

      it "takes arguments which override the defaults" do
        client = Client.new

        expect(client.client).to receive(:search)
          .with(q: "file:foo.jpg", index: "bar", sort: "file:asc")
        client.search(q: "file:foo.jpg", index: "bar", sort: "file:asc")
      end

      it "deletes teh model option" do
        client = Client.new

        expect(client.client).to receive(:search)
          .with(q: "file:foo.jpg", index: "bar", sort: "file:asc")
        client.search(q: "file:foo.jpg", model: "baz", index: "bar", sort: "file:asc")
      end
    end
  end
end
