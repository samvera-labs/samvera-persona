require 'rails_helper'

RSpec.describe Samvera::Persona do
  it "has a version number" do
    expect(Samvera::Persona::VERSION).not_to be nil
  end

  describe "configuration" do
    it "sets a default for soft_delete" do
      expect(Samvera::Persona.soft_delete).to eq true
    end

    context "with setup block" do
      around do |example|
        original = Samvera::Persona.soft_delete
        example.run
        Samvera::Persona.soft_delete = original
      end

      it "sets soft_delete" do
        expect { Samvera::Persona.setup { |config| config.soft_delete = false } } 
          .to change { Samvera::Persona.soft_delete }.from(true).to(false)
      end
    end
  end
end
