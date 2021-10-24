class FileImportedsController < ApplicationController
  before_action :set_file_imported, only: %i[ show edit update destroy ]

  # GET /file_importeds or /file_importeds.json
  def index
    @file_importeds = FileImported.all
  end

  # GET /file_importeds/1 or /file_importeds/1.json
  def show
  end

  # GET /file_importeds/new
  def new
    @file_imported = FileImported.new
  end

  # GET /file_importeds/1/edit
  def edit
  end

  # POST /file_importeds or /file_importeds.json
  def create
    @file_imported = FileImported.new(file_imported_params)

    respond_to do |format|
      if @file_imported.save
        format.html { redirect_to @file_imported, notice: "File imported was successfully created." }
        format.json { render :show, status: :created, location: @file_imported }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @file_imported.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /file_importeds/1 or /file_importeds/1.json
  def update
    respond_to do |format|
      if @file_imported.update(file_imported_params)
        format.html { redirect_to @file_imported, notice: "File imported was successfully updated." }
        format.json { render :show, status: :ok, location: @file_imported }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @file_imported.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /file_importeds/1 or /file_importeds/1.json
  def destroy
    @file_imported.destroy
    respond_to do |format|
      format.html { redirect_to file_importeds_url, notice: "File imported was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_file_imported
      @file_imported = FileImported.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def file_imported_params
      params.require(:file_imported).permit(:filename, :status, :user_id)
    end
end
