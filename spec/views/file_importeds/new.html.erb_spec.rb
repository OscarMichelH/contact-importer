# require 'rails_helper'
#
# RSpec.describe "file_importeds/new", type: :view do
#   before(:each) do
#     assign(:file_imported, FileImported.new(
#       :filename => "MyString",
#       :status => "MyString",
#       :user => nil
#     ))
#   end
#
#   it "renders new file_imported form" do
#     render
#
#     assert_select "form[action=?][method=?]", file_importeds_path, "post" do
#
#       assert_select "input[name=?]", "file_imported[filename]"
#
#       assert_select "input[name=?]", "file_imported[status]"
#
#       assert_select "input[name=?]", "file_imported[user_id]"
#     end
#   end
# end
