class Url < ApplicationRecord
  validates :original, presence: true, on: :create
  validates_format_of :original,
    with: /\A(?:(?:http|https):\/\/)?([-a-zA-Z0-9.]{2,256}\.[a-z]{2,4})\b(?:\/[-a-zA-Z0-9@,!:%_\+.~#?&\/\/=]*)?\z/
  before_create :generate_short_url

  def generate_short_url
    chars = ['0'..'9','A'..'Z','a'..'z'].map{|range| range.to_a}.flatten
    self.short = 6.times.map{chars.sample}.join
    self.short = 6.times.map{chars.sample}.join until Url.find_by(short: self.short).nil?
  end

  def find_duplicate
    Url.find_by(sanitized: self.sanitized)
  end

  def new_url?
    find_duplicate.nil?
  end

  def sanitize
    self.original.strip!
    self.sanitized = self.original.downcase.gsub(/(https?:\/\/)|(www\.)/, "")
    self.sanitized.slice!(-1) if self.sanitized[-1] == "/"
    self.sanitized = "http://#{self.sanitized}"
  end

  def shortened_url
  	"http://#{URI.parse(sanitized).host}/#{short}"
  end
end