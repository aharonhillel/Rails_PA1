class EnrollmentsController < ApplicationController
  # before_action :set_enrollment, only: [:show, :edit, :update, :destroy]

  # GET /enrollments
  # GET /enrollments.json
  def index
    @enrollments = Enrollment.all
  end


  # GET /enrollments/new
  def new
    @enrollment = Enrollment.new
  end


  # POST /enrollments
  # POST /enrollments.json
  def create
    @enrollment = Enrollment.new(enrollment_params)

    respond_to do |format|
      if @enrollment.save
        format.html { redirect_to courses, notice: 'Enrollment was successfully created.' }
        format.json { render :show, status: :created, location: @enrollment }
        format.js
      else
        format.html { render :new }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }

      end
    end
  end

  # PATCH/PUT /enrollments/1
  # PATCH/PUT /enrollments/1.json
  def update
    respond_to do |format|
      if @enrollment.update(enrollment_params)
        format.html { redirect_to @enrollment, notice: 'Enrollment was successfully updated.' }
        format.json { render :show, status: :ok, location: @enrollment }
      else
        format.html { render :edit }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity, notice: 'You are already enrolled in this course' }
      end
    end
  end

  # DELETE /enrollments/1
  # DELETE /enrollments/1.json

  def destroy
    @enrollment.destroy
    respond_to do |format|
      format.html { redirect_to current_user, notice: 'You are offically Un-enrolled.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enrollment
      @enrollment = Enrollment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enrollment_params
      params.permit(:course_id, :user_id)
    end
end
