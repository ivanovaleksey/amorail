require "spec_helper"
require "webmock/rspec"

describe "spec for Amorail Properties" do
  before(:each) { mock_api }

  let(:prop) {Amorail.properties}

  it "should parse companies hash" do
    expect(prop.company.phone.present?).to be_truthy
    expect(prop.company.phone.is_a?(Amorail::Property::PropertyItem)).to be_truthy
    expect(prop.company.phone.id.present?).to be_truthy
    expect(prop.company.data["phone"].data["id"]).to eq prop.company.phone.id

    expect(prop.company.phone.id).to eq "1460589"
    expect(prop.company.address.id).to eq "1460597"
    expect(prop.company.email.id).to eq "1460591"
    expect(prop.company.web.id).to eq "1460593"
  end

  it "should parse contacts hash" do
    expect(prop.contact.email.present?).to be_truthy
    expect(prop.contact.im.is_a?(Amorail::Property::PropertyItem)).to be_truthy
    expect(prop.contact.im.id.present?).to be_truthy
    expect(prop.contact.data["im"].data["id"]).to eq prop.contact.im.id

    expect(prop.contact.im.id).to eq "1460595"
    expect(prop.contact.position.id).to eq "1460587"
    expect(prop.contact.phone.id).to eq "1460589"
    expect(prop.contact.email.id).to eq "1460591"
  end

  it "should parse leads hash" do
    expect(prop.lead.statuses["Первичный контакт"].id).to eq "8195972"
    expect(prop.lead.statuses["Успешно реализовано"].id).to eq "142"
  end

  it "should parse task types" do
    expect(prop.task.follow_up.id).to eq 1
    expect(prop.task["CALL"].id).to eq 1
  end
end