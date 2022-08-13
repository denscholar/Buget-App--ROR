class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }

  def total_expenses(id)
    total = 0
    Expense.where(group_id: id).each do |expense|
      total += expense.amount
    end
    total
  end
end
