# require 'rails_helper'
#
# RSpec.describe "contacts/new", type: :view do
#   before(:each) do
#     assign(:contact, Contact.new(
#       :name => "MyString",
#       :phone => "MyString",
#       :address => "MyText",
#       :credit_card => "MyString",
#       :franchise => "MyString",
#       :email => "MyString",
#       :user => nil
#     ))
#   end
#
#   it "renders new contact form" do
#     render
#
#     assert_select "form[action=?][method=?]", contacts_path, "post" do
#
#       assert_select "input[name=?]", "contact[name]"
#
#       assert_select "input[name=?]", "contact[phone]"
#
#       assert_select "textarea[name=?]", "contact[address]"
#
#       assert_select "input[name=?]", "contact[credit_card]"
#
#       assert_select "input[name=?]", "contact[franchise]"
#
#       assert_select "input[name=?]", "contact[email]"
#
#       assert_select "input[name=?]", "contact[user_id]"
#     end
#   end
# end
