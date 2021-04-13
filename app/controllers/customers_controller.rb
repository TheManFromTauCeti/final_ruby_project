class CustomersController < ApplicationController
  def index
  end

  def show
  end

  def create
    @customer = Customer.new(
      first_name:            params[:first_name],
      last_name:             params[:last_name],
      email:                 params[:email],
      password:              params[:password],
      password_confirmation: params[:password_confirmation]
    )

    # Save will return false if any of our validations fail.
    @worked = @customer.save

    if @worked
      puts "customer was saved to the database customers table."
      puts @customer.inspect
    else
      puts "There was an error saving customer to the database."

      # We can loop through all the validation errors.
      @customer.errors.messages.each do |column, errors|
        errors.each do |error|
          puts "The #{column} property #{error}."
        end
      end
    end
  end

  def new
  end
end
