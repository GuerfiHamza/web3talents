class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  has_many :experiences
  has_many :job_applications
  has_many :jobs
  has_many :skills
  accepts_nested_attributes_for :experiences, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :skills, reject_if: :all_blank, allow_destroy: true
  has_one_attached :profile_picture
  # has_one_attached :cover_picture
  has_many :notifications, as: :recipient, dependent: :destroy
  has_many :conversations, through: :messages
  has_many :sent_conversations, foreign_key: 'sender_id', class_name: 'Conversation', dependent: :destroy
  has_many :received_conversations, foreign_key: 'recipient_id', class_name: 'Conversation', dependent: :destroy


  JOBS = ["Full Stack Developer", "Front End Developer", "Back End Developer", "DevOps", "Data Scientist", "Data Analyst", "UX Designer", "UI Designer", "Product Manager", "Project Manager", "QA Engineer", "Software Engineer", "Software Architect", "Software Developer", "Software Tester", "Technical Lead", "Technical Architect", "Technical Manager", "Technical Consultant", "Technical Specialist", "Technical Writer", "Technical Recruiter", "Technical Support", "Technical Trainer", "Technical Sales", "Technical Account Manager", "Technical Account Executive", "Technical Account Director", "Technical Account Specialist", "Technical Account Representative", "Technical Account Coordinator", "Technical Account Engineer", "Technical Account Administrator", "Technical Account Associate", "Technical Account Analyst", "Technical Account Advisor", "Technical Account Agent", "Technical Account Assistant", "Technical Account Administrator", "Technical Account Agent", "Technical Account Assistant", "Technical Account Administrator", "Technical Account Agent", "Technical Account Assistant", "Technical Account Administrator", "Technical Account Agent", "Technical Account Assistant", "Technical Account Administrator", "Technical Account Agent", "Technical Account Assistant", "Technical Account Administrator", "Technical Account Agent", "Technical Account Assistant", "Technical Account Administrator", "Technical Account Agent", "Technical Account Assistant", "Technical Account Administrator", "Technical Account Agent", "Technical Account Assistant", "Technical Account Administrator", "Technical Account Agent", "Technical Account Assistant", "Technical Account Administrator", "Technical Account Agent", "Technical Account Assistant", "Technical Account Administrator", "Technical Account Agent", "Technical Account Assistant", "Technical Account Administrator", "Technical Account Agent", "Technical Account Assistant", "Technical Account Administrator"]

end
