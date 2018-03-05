require "spec_helper"

RSpec.describe ActiveRecord::Type::Symbol do
  it "has a version number" do
    expect(ActiveRecord::Type::Symbol::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
