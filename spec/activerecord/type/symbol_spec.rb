require "spec_helper"

RSpec.describe ActiveRecord::Type::Symbol do
  it "has a version number" do
    expect(ActiveRecord::Type::Symbol::VERSION).not_to be nil
  end

  with_model :ModelWithSymbolAttribute do
    table do |t|
      t.string :data_type
    end

    model do
      attribute :data_type, :symbol
    end
  end

  context "attribute assignment" do
    context "by initializer" do
      context "coerces string to symbol" do
        let(:model) { ModelWithSymbolAttribute.new(data_type: 'numeric') }

        specify do
          expect(model.data_type).to eq(:numeric)
        end
      end

      context "coerces symbol to symbol" do
        let(:model) { ModelWithSymbolAttribute.new(data_type: :numeric) }

        specify do
          expect(model.data_type).to eq(:numeric)
        end
      end
    end

    context "by attribute setter" do
      let(:model) { ModelWithSymbolAttribute.new }
      context "coerces string to symbol" do
        before { model.data_type = 'numeric' }

        specify do
          expect(model.data_type).to eq(:numeric)
        end
      end

      context "coerces symbol to symbol" do
        before { model.data_type = :numeric }

        specify do
          expect(model.data_type).to eq(:numeric)
        end
      end
    end
  end
end
