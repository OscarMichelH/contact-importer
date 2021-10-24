class ContactsController < ApplicationController
  before_action :set_contact, only: %i[ show edit update destroy ]

  # GET /contacts or /contacts.json
  def index
    @contacts = Contact.all
  end

  # GET /contacts/1 or /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts or /contacts.json
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: "Contact was successfully created." }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1 or /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: "Contact was successfully updated." }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1 or /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: "Contact was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import_csv
    attachment_matched = params['attachment']
    if attachment_matched
      workbook = Roo::Spreadsheet.open(params[:attachment])
      workbook.default_sheet = workbook.sheets[0]
      headers = Hash.new
      workbook.row(1).each_with_index {|header,i|
        headers[header] = i
      }

      file = FileImported.new(filename: params[:attachment].original_filename, status: 'Processing', user_id: current_user.id)
      file.save!

      contacts = []
      (workbook.first_row+1..workbook.last_row).each do |row|
        name = workbook.row(row)[headers[params['name_header']]]
        birthdate = workbook.row(row)[headers[params['birthdate_header']]]
        phone = workbook.row(row)[headers[params['phone_header']]]
        address = workbook.row(row)[headers[params['address_header']]]
        credit_card = workbook.row(row)[headers[params['credit_card_header']]]
        franchise = CreditCardDetector::Detector.new(credit_card)&.brand_name || 'Not Valid'
        email = workbook.row(row)[headers[params['credit_card_header']]]
        contacts << Contact.new(name: name, birthdate: birthdate, phone: phone,
        address: address, credit_card: credit_card, franchise: franchise, email: email,
                                user_id: current_user.id)
      end


      redirect_to file_importeds_path, notice: "Processing file"
    else
      @file_path = params[:contact][:attachment].path
      workbook = Roo::Spreadsheet.open(@file_path)
      workbook.default_sheet = workbook.sheets[0]
      @headers = []
      workbook.row(1).each {|header|
        @headers << header
      }

      render 'home/index'
    end


  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      params.require(:contact).permit(:name, :birthdate, :phone, :address, :credit_card, :franchise, :email, :user_id)
    end
end
