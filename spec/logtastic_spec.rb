require 'spec_helper'

describe Logtastic do
  subject = Logtastic

  describe ".client" do
    it "creates a new Logtastic::Client" do
      expect(subject.client).to be_a(Logtastic::Client)
    end
  end

  describe ".registry" do
    it "is the registry" do
      expect(subject.registry).to be Logtastic::Registry
    end
  end

  describe ".model" do
    it "is the model" do
      expect(subject.model).to be Logtastic::Model
    end
  end
end
