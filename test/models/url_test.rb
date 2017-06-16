require 'rails_helper'

RSpec.describe User, :type => :model do
  it "is valid with a valid url" do
    url = build(:url)
    expect(url).to be_valid
  end

  it "is invalid without a url" do
    url = build(:url, original_url: nil)
    url.valid?
    expect(url.errors[:original_url]).to include("Please enter the URL you want to shorten")
  end

  it "is invalid with an invalid URL" do
    url = build(:url, original_url: "abc")
    url.valid?
    expect(url.errors[:original_url]).to include("Please enter a valid URL")
  end

  it "dowcases original_url before saving it as sanitized_url" do
    url = build(:url, original_url: 'Google.com')
    url.sanitize
    expect(url.sanitized_url).to eq('http://google.com')
  end
end
