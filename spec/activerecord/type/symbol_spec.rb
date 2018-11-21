# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ActiveRecord::Type::Symbol do
  it 'has a version number' do
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

  context 'attribute assignment' do
    context 'by initializer' do
      context 'coerces string to symbol' do
        let(:model) { ModelWithSymbolAttribute.new(data_type: 'numeric') }

        specify do
          expect(model.data_type).to eq(:numeric)
        end
      end

      context 'coerces symbol to symbol' do
        let(:model) { ModelWithSymbolAttribute.new(data_type: :numeric) }

        specify do
          expect(model.data_type).to eq(:numeric)
        end
      end
    end

    context 'by attribute setter' do
      let(:model) { ModelWithSymbolAttribute.new }

      context 'coerces string to symbol' do
        before { model.data_type = 'numeric' }

        specify do
          expect(model.data_type).to eq(:numeric)
        end
      end

      context 'coerces symbol to symbol' do
        before { model.data_type = :numeric }

        specify do
          expect(model.data_type).to eq(:numeric)
        end
      end
    end
  end

  context 'saving attribute' do
    let!(:model) { ModelWithSymbolAttribute.create!(data_type: :numeric) }

    it 'deserializes to a symbol' do
      expect(model.reload.data_type).to eq(:numeric)
    end
  end

  context 'dirty tracking' do
    let(:model) { ModelWithSymbolAttribute.new(data_type: :numeric) }

    context 'model changes' do
      before do
        model.save
        model.data_type = :float
      end

      specify do
        expect(model.data_type_was).to eq(:numeric)
        if ActiveRecord::VERSION::MAJOR == 5 && ActiveRecord::VERSION::MINOR == 0
          expect(model.data_type_changed?).to be(true)
        else
          expect(model.will_save_change_to_data_type?).to be(true)
        end
      end
    end

    context 'model does not change' do
      before do
        model.save
        model.data_type = :numeric
      end

      specify do
        expect(model).not_to be_changed
      end
    end
  end
end
