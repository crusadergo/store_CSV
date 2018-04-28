class StoreCsvsController < ApplicationController
  before_action :set_store_csv, only: [:update, :destroy]

  def index
    @store_csvs = StoreCsv.all
  end

  def new
    @store_csv = StoreCsv.new
  end

  def create
    if store_csv_params[:file]
      CSV.foreach store_csv_params[:file].path, headers: true do |csv|
        store_csv = StoreCsv.new name: csv['name'], number: csv['number'], date: csv['date'], description: csv['description']
        store_csv.save!
      end

      redirect_to store_csvs_path, notice: 'CSV uploaded'
    else
      @store_csv = StoreCsv.new

      flash.now[:alert] = 'Please, upload the file!'

      render 'new'
    end
  end

  def destroy
    @store_csv.destroy
    respond_to do |format|
      format.html { redirect_to store_csvs_url, notice: 'Store csv was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_store_csv
      @store_csv = StoreCsv.find(params[:id])
    end

    def store_csv_params
      params.fetch(:store_csv, {}).permit(:file)
    end
end
