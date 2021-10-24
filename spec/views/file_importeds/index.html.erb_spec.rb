require 'rails_helper'

RSpec.describe "file_importeds/index", type: :view do
  before(:each) do
    assign(:file_importeds, [
      FileImported.create!(
        :filename => "Filename",
        :status => "Status",
        :user => nil
      ),
      FileImported.create!(
        :filename => "Filename",
        :status => "Status",
        :user => nil
      )
    ])
  end

  it "renders a list of file_importeds" do
    render
    assert_select "tr>td", :text => "Filename".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
