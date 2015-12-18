class Project < ActiveRecord::Base
  has_attached_file :picture, styles: { large: "800x400>", medium: "300x150>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
end
