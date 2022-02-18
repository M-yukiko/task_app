class Schedule < ApplicationRecord
  validates :title, presence: true,length: { maximum: 5 }
  validates :start, presence: true
  validates :close, presence: true
  after_validation :start_end_check
  validates :memo, length: { maximum: 200 }
  
  def start_end_check
    return if start.presence && close.presence && self.start <= self.close
    errors.add(:close, "は開始日以降の日付で登録ください。") 
  end
  
end
