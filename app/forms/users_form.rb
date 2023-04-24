class UsersForm < ApplicationForm
  attr_accessor :name, :email

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }

  delegate :persisted?, to: :user

  def initialize(attributes = nil, user: User.new)
    @user = user
    attributes ||= default_attributes
    super(attributes)
  end

  def save!
    return if invalid?

    ActiveRecord::Base.transaction do
      user.update!(name: name, email: email)
    end
  rescue ActiveRecord::RecordInvalid
    false
  end

  def to_model
    user
  end

  private

  attr_reader :user

  def default_attributes
    {
      name: user.name,
      email: user.email
    }
  end
end
