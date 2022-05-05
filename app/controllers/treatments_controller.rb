class TreatmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_treatment_by_id, only: [:edit, :show, :update, :destroy]
  before_action :redirect_index_missing_treatment, only: [:edit, :show]

  PERMITTED_PARAMS= [:treatment_type, :status, :description, :title, :user_id]

  def index
    @treatments = Treatment.where.not(status: 'done')
    @treatments = @treatments.order(created_at: :desc)
    
    @treatments = Treatment.where(user: current_user) if current_user.student?

    # @treatments = Treatment.all
    # @treatments = @treatments.where(treatment_type: filter_params) if filter_params.present?
    # @treatments = @treatments.where('title LIKE :search OR description LIKE :search', search: "%#{search_param}%").distinct if search_param.present?
    # @treatments = @treatments.order(created_at: :desc)
  end

  def new
    @treatment = Treatment.new
  end

  def edit; end

  def show; end

  def create
    @treatment = Treatment.new(permit_params)
    @treatment.user = current_user

    if @treatment.save
      redirect_to_show
      success_flash
    else
      error_flash
      render(:new)
    end
  end

  def update
    if @treatment.update(permit_params)
      redirect_to_show
      success_flash
    else
      error_flash
      render(:edit)
    end
  end

  def destroy
    if @treatment.present?
      @treatment.destroy
      success_flash
    else
      error_flash
    end
    redirect_to_index
  end

  private

  def success_flash
    flash[:success] = t('.success')
  end

  def error_flash
    flash[:error] = t('.error')
  end

  def redirect_to_show
    redirect_to(@treatment)
  end

  def redirect_to_index
    redirect_to(treatments_path)
  end

  def find_treatment_by_id
    @treatment = Treatment.find_by(id: params[:id])
  end

  def redirect_index_missing_treatment
    redirect_to_index unless @treatment.present?
  end

  def permit_params
    params.require(:treatment).permit(PERMITTED_PARAMS)
  end

  def search_param
    params[:search]
  end

  def filter_params
    params.fetch(:treatment_type, '')
  end

end
