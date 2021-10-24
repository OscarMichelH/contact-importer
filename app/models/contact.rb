class Contact < ApplicationRecord
  belongs_to :user

  validates :name, format: { with: /\A[a-zA-Z -]+\z/ , message: 'no special characters valids' }
  validates :address, presence: true
  validate :validate_date
  validate :validate_phone
  validates :franchise, presence: true
  validates :credit_card, format: { with: /\A[\*]+\d{4}\z/ , message: 'not valid format' }
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i , message: 'not valid format' }
  validate :validate_email_duplicated

  def validate_date
    format1_ok = self.birthdate&.match(/\d{4}-\d{2}-\d{2}/)
    format2_ok = self.birthdate&.match(/\d{8}/)
    errors.add(:birthdate, 'error on format') unless (format1_ok || format2_ok)
  end

  def validate_phone
    format1_ok = self.phone&.match(/\A\(\+\d{2}\) \d{3}-\d{3}-\d{2}-\d{2}\z/)
    format2_ok = self.phone&.match(/\A\(\+\d{2}\) \d{3} \d{3} \d{2} \d{2}\z/)
    errors.add(:phone, 'error on  format') unless (format1_ok || format2_ok)
  end

  def validate_email_duplicated
    errors.add(:email, 'duplicated') if Contact.where(email: self.email, user_id: self.user_id)&.count > 0
  end

end
