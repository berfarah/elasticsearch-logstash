require 'logtastic/registry'

module Logtastic
  class ExampleModel < Model
  end

  describe Registry do
    subject = Registry

    describe '.model_for' do
      it "finds the model by index" do
        expect(subject.model_for(nil)).to be Model
      end
    end

    describe ".add" do
      it "adds a model to the registry" do
        subject.add(ExampleModel, :example)
        expect(subject.model_for(:example)).to be ExampleModel
      end
    end

    describe ".remove" do
      it "removes a model from the registry (and falls back to Model)" do
        subject.remove(:example)
        expect(subject.model_for(:example)).to be Model
      end
    end
  end
end
