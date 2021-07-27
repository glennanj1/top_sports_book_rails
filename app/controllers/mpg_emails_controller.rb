class MpgEmailsController < ApplicationController
  before_action :set_mpg_email, only: %i[ show edit update destroy ]

  # GET /mpg_emails or /mpg_emails.json
  def index
    @mpg_emails = MpgEmail.all
  end

  # GET /mpg_emails/1 or /mpg_emails/1.json
  def show
  end

  # GET /mpg_emails/new
  def new
    @mpg_email = MpgEmail.new
  end

  # GET /mpg_emails/1/edit
  def edit
  end

  # POST /mpg_emails or /mpg_emails.json
  def create
    @mpg_email = MpgEmail.new(mpg_email_params)

    respond_to do |format|
      if @mpg_email.save
        format.json { render json: { status: 'success', email: @mpg_email } }
      else 
        format.json { render json: { status: 'error', email: @mpg_email } }
      end
    end
  end

  # PATCH/PUT /mpg_emails/1 or /mpg_emails/1.json
  def update
    respond_to do |format|
      if @mpg_email.update(mpg_email_params)
        format.html { redirect_to @mpg_email, notice: "Mpg email was successfully updated." }
        format.json { render :show, status: :ok, location: @mpg_email }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mpg_email.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mpg_emails/1 or /mpg_emails/1.json
  def destroy
    @mpg_email.destroy
    respond_to do |format|
      format.html { redirect_to mpg_emails_url, notice: "Mpg email was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mpg_email
      @mpg_email = MpgEmail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mpg_email_params
      params.require(:mpg_email).permit(:email)
    end
end
