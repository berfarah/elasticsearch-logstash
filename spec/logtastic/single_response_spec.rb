require 'logtastic/single_response'

module Logtastic
  describe SingleResponse do
    first_response = SAMPLE_RESPONSE['hits']['hits'][0]
    subject = SingleResponse.new first_response

    describe '#raw_json' do
      it "is the parsed JSON" do
        expect(subject.raw_json).to eq first_response
      end
    end

    describe "#raw" do
      it "is the ResponseWrapper" do
        expect(subject.response).to be_a(ResponseWrapper)
      end
    end

    describe "#body" do
      it "maps the chosen model to the body" do
        body = subject.body

        expect(body).to be_a Model
        expect(body.id).to eq 'AVOatY7oTrQdHcxd1FrN'
      end
    end

    describe "#as_json" do
      it "returns the body" do
        expect(subject.as_json).to eq subject.body
      end
    end
  end
end
