require 'elasticsearch/logstash/response'

module Elasticsearch
  module Logstash
    describe Response do
      subject = Response.new SAMPLE_RESPONSE

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

      describe "#size" do
        it "returns the size of the payload" do
          expect(subject.size).to be 3
        end
      end

      describe "#body" do
        it "maps the chosen model to the body" do
          body = subject.body

          expect(body).to all(be_a(Model))
          expect(body.first.id).to eq 'AVOatY7oTrQdHcxd1FrN'
        end
      end

      describe "#as_json" do
        it "returns the body" do
          expect(subject.as_json).to eq subject.body
        end
      end
    end
  end
end
