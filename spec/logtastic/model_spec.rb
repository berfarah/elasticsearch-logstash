require 'logtastic/response'
require 'logtastic/model'

module Logtastic
  class ChildModel < Model
    delegate :cpu
    delegate :ram, expose: false
    expose :foo

    def foo
      "foo"
    end

    def bar
      "bar"
    end
  end

  describe Model do
    response = ResponseWrapper.new(SAMPLE_RESPONSE).hits.hits.first
    subject  = Model.new(response)
    child = ChildModel.new(response)

    describe "#id" do
      it "is the id" do
        expect(subject.id).to eq "AVOatY7oTrQdHcxd1FrN"
      end
    end

    describe "#timestamp" do
      it "is the timestamp" do
        expect(subject.timestamp).to eq "2016-03-21T19:45:02.000Z"
      end
    end

    describe ".delegate" do
      it "delegates the method to _source" do
        expect(child.cpu).to eq "0.37"
      end

      it "exposes the method to as_json" do
        expect(child.as_json[:cpu]).to eq "0.37"
      end

      it "doesn't expose when expose is set to false" do
        expect(child.as_json[:ram]).to be_nil
      end
    end

    describe ".expose" do
      it "exposes the method to as_json" do
        expect(child.as_json[:foo]).to eq "foo"
      end
    end
  end
end
