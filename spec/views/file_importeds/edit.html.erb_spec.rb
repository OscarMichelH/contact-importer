# require 'rails_helper'
#
# RSpec.describe "file_importeds/edit", type: :view do
#   before(:each) do
#     @file_imported = assign(:file_imported, FileImported.create!(
#       :filename => "MyString",
#       :status => "MyString",
#       :user => nil
#     ))
#   end
#
#   it "renders the edit file_imported form" do
#     render
#
#     assert_select "form[action=?][method=?]", file_imported_path(@file_imported), "post" do
#
#       assert_select "input[name=?]", "file_imported[filename]"
#
#       assert_select "input[name=?]", "file_imported[status]"
#
#       assert_select "input[name=?]", "file_imported[user_id]"
#     end
#   end
# end
