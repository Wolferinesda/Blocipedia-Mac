require 'rails_helper'

RSpec.describe Wiki, type: :model do
  before do
    @user = User.new(email: "fake@fake.com", password: "helloworld")
    @user.skip_confirmation!
    @user.save
    @my_wiki  = Wiki.new(title: "Test Title", body: "This is a fake test body for the Wiki", private: false, user: @user)
    @my_wiki.save
  end

  let(:my_wiki) { Wiki.create!(title: @my_wiki.title, body: @my_wiki.body, user: @user) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_presence_of(:user) }

  it { is_expected.to validate_length_of(:title).is_at_least(5) }
  it { is_expected.to validate_length_of(:body).is_at_least(20) }

  describe "attributes" do
    it "has title, body, and user attributes" do
      expect(my_wiki).to have_attributes(title: @my_wiki.title, body: @my_wiki.body, user: @user)
    end
  end
end
