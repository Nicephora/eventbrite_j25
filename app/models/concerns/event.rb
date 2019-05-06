class Event < ApplicationRecord

    belongs_to :administrator, class_name: "User"
    has_many :attendances
    has_many :users, through: :attendances

  validates :start_date, presence: true
  validate :expiration_date_cannot_be_in_the_past, :duration_multiple_of_5
  validates :duration, presence: true
  validates :title, length: { minimum: 6, maximum: 14 }, presence:true
  validates :description, length: { minimum: 20, maximum: 1000 }, presence:true
  validates :price, numericality:{ greater_than: 20, less_than: 1000 }
  validates :location, presence: true


  def expiration_date_cannot_be_in_the_past
    if expiration_date.present? && expiration_date < Date.now
      errors.add(:expiration_date, "can't be in the past")
    end
  end

  def duration_multiple_of_5
    if duration.present? && (duration % 5 != 0 || duration < 0)
      errors.add(:duration, "la durée n'est pas un multiple de 5")
    end
  end

end
