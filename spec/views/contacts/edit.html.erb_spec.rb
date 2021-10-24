require 'rails_helper'

RSpec.describe "contacts/edit", type: :view do
  before(:each) do
    @contact = assign(:contact, Contact.create!(
      :name => "MyString",
      :phone => "MyString",
      :address => "MyText",
      :credit_card => "MyString",
      :franchise => "MyString",
      :email => "MyString",
      :user => nil
    ))
  end

  it "renders the edit contact form" do
    render

    assert_select "form[action=?][method=?]", contact_path(@contact), "post" do

      assert_select "input[name=?]", "contact[name]"

      assert_select "input[name=?]", "contact[phone]"

      assert_select "textarea[name=?]", "contact[address]"

      assert_select "input[name=?]", "contact[credit_card]"

      assert_select "input[name=?]", "contact[franchise]"

      assert_select "input[name=?]", "contact[email]"

      assert_select "input[name=?]", "contact[user_id]"
    end
  end
end
