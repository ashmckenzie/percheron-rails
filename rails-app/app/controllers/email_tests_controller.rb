class EmailTestsController < ApplicationController

  def index
    redirect_to(new_email_test_path)
  end

  def new
    @email_test = EmailTest.new
  end

  def create
    @email_test = EmailTest.new(email_test_params)

    respond_to do |format|
      if @email_test.save
        format.html { redirect_to(new_email_test_path, notice: 'Email test was successfully created.') }
      else
        format.html { render :new }
      end
    end
  end

  private

    def email_test_params
      params.require(:email_test).permit(:email)
    end
end
