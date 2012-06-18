class Project < ActiveRecord::Base
  attr_accessible :description, :status, :title, :appointments_attributes, :pictures_attributes, :roles_attributes
  attr_searchable :created_at, :description, :status, :title, :updated_at

  has_paper_trail

  has_many :appointments, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :pictures, :dependent => :destroy
  has_many :roles, :dependent => :destroy
  belongs_to :user

  has_many :followups
  has_many :users, :through => :followups

  accepts_nested_attributes_for :appointments, :reject_if => lambda { |a| a[:date].blank? || a[:description].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :pictures, :reject_if => lambda { |a| a[:image].blank? || a[:title].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :roles, :reject_if => lambda { |a| a[:title].blank? }, :allow_destroy => true

  validates_length_of :title, :within => 3..255, :too_short => I18n.t("validations.length.short", :attr => I18n.t("validations.attr.title"), :count => "%{count}"), :too_long => I18n.t("validations.length.long", :attr => I18n.t("validations.attr.title"), :count => "%{count}")
  validates :status, :presence => { :message => I18n.t("validations.attr.status") }
  validates_length_of :description, :within => 10..5000, :too_short => I18n.t("validations.length.short", :attr => I18n.t("validations.attr.description"), :count => "%{count}"), :too_long => I18n.t("validations.length.long", :attr => I18n.t("validations.attr.description"), :count => "%{count}")

  def self.remove_old
    Version.delete_all ["created_at < ?", 1.day.ago]
  end
end
