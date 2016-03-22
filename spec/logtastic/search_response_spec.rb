require 'logtastic/search_response'

module Logtastic
  describe SearchResponse do
    subject = SearchResponse.new SAMPLE_RESPONSE

    describe '#raw_json' do
      it "is the parsed JSON" do
        expect(subject.raw_json).to eq SAMPLE_RESPONSE
      end
    end

    describe "#raw" do
      it "is the ResponseWrapper" do
        expect(subject.response).to be_a(ResponseWrapper)
      end
    end

    describe "#total" do
      it "returns the total hits" do
        expect(subject.total).to be 2_447
      end
    end

    describe "#count" do
      it "returns the size of the payload" do
        expect(subject.count).to be 10
      end
    end

    describe "#body" do
      it "maps the chosen model to the body" do
        expect(subject.body).to all(be_a(Model))
        expect(subject.first.id).to eq 'AVOatY7oTrQdHcxd1FrN'
      end
    end

    describe "#as_json" do
      it "returns the body" do
        expect(subject.as_json).to eq subject.body
      end
    end
  end
end
