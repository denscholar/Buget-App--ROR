class ExpensesController < ApplicationController
  def index
    @group_id = Group.find(params[:group_id])
    @expenses = Expense.where(group_id: @group_id.id).order(created_at: :desc)
  end

  def show; end

  def new
    @group_id = Group.find(params[:group_id]).id
    @expense = Expense.new
  end

  def edit; end

  def create
    @expense = Expense.new(expense_params)
    @expense.user_id = current_user.id
    @group = Group.find(params[:group_id])

    @expense.group_id = @group.id

    if @expense.save
      redirect_to user_group_expenses_url(user_id: current_user.id, group_id: @group.id)
    else
      render :new
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end
