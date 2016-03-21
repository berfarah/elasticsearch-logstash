require 'spec_helper'

module Elasticsearch
  describe Logstash do
    subject = Logstash

    describe ".client" do
      it "creates a new Logstash::Client" do
        expect(subject.client).to be_a(Logstash::Client)
      end
    end

    describe ".registry" do
      it "is the registry" do
        expect(subject.registry).to be Logstash::Registry
      end
    end

    describe ".model" do
      it "is the model" do
        expect(subject.model).to be Logstash::Model
      end
    end
  end
end
