class Profile < ApplicationRecord
  belongs_to :user
  has_many :photos, :dependent => :destroy

  validates :height,
            presence: {message: '身長が空白です'},
            numericality:{ allow_blank: true, only_integer: true, greater_than: 100, less_than: 220, message: '身長の値を確認ください'}
  validates :weight,
            presence: {message: '体重が空白です'},
            numericality:{ allow_blank: true, only_integer: true, greater_than: 40, less_than: 200, message: '体重の値を確認ください' }
  validates :age,
            presence: {message: '年齢が空白です'},
            numericality:{ allow_blank: true, only_integer: true, greater_than: 15, less_than: 100, message: '年齢の値を確認ください' }
  validates :trainer, presence: true
  validates :direction, presence: true
  validates :experience, presence: true
  
end
