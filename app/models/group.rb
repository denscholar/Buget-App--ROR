class Group < ApplicationRecord
    belongs_to :user
    has_many :expenses

    validates :name, presence: true, length: { minimum: 3, maximum: 100 }

  def user_name(user_id)
    User.find(user_id).name
  end

  def total_spent(id)
    expenses = Expense.where(group_id: id)
    total = 0
    expenses.each do |expense|
      total += expense.amount
    end
    total
  end
end
