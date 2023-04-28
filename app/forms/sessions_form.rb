class SessionsForm < ApplicationForm
  attribute :email, :string
  attribute :password, :string

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true

  validate :valid_combination

  def save!
    return false if invalid?

    true
  end

  private

  # ユーザーが見つからない、またはパスワードに誤りがある場合にエラーを返す
  def valid_combination
    @user = User.find_by(email: email)
    errors.add(:base, 'メールアドレスとパスワードの組み合わせが正しくありません') unless @user&.authenticate(password)
  end
end
