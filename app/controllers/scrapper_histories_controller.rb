class ScrapperHistoriesController < ApplicationController
  before_action :set_scrapper_history, only: [:show, :edit, :update, :destroy]

  def scrape_local
    f = File.open(Dir.pwd+"/Additional Docs/SportsPages/BBC Test Data.html")
    doc = Nokogiri::HTML(f)
    dateArray = doc.css('table.table-stats')#Date is contain in a super class
    dateArray.each {
      |dateElement|
      matchArray = dateElement.css('tr.preview')#Get all the match instances for the date
      y = 0
      matchArray.each { 
        |x|
        puts dateElement.css('caption').text[38..-1] + " " + x.css('.kickoff').text.strip
        puts 'Game: ' + y.to_s + " Home: " + x.css('.team-home a').text.strip + ' v Away: ' + x.css('.team-away a').text.strip
        y += 1
        }
    }
    f.close
    redirect_to :back
  end
  # GET /scrapper_histories
  # GET /scrapper_histories.json
  def index
    @scrapper_histories = ScrapperHistory.all
  end

  # GET /scrapper_histories/1
  # GET /scrapper_histories/1.json
  def show
  end

  # GET /scrapper_histories/new
  def new
    @scrapper_history = ScrapperHistory.new
  end

  # GET /scrapper_histories/1/edit
  def edit
  end

  # POST /scrapper_histories
  # POST /scrapper_histories.json
  def create
    @scrapper_history = ScrapperHistory.new(scrapper_history_params)

    respond_to do |format|
      if @scrapper_history.save
        format.html { redirect_to @scrapper_history, notice: 'Scrapper history was successfully created.' }
        format.json { render :show, status: :created, location: @scrapper_history }
      else
        format.html { render :new }
        format.json { render json: @scrapper_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scrapper_histories/1
  # PATCH/PUT /scrapper_histories/1.json
  def update
    respond_to do |format|
      if @scrapper_history.update(scrapper_history_params)
        format.html { redirect_to @scrapper_history, notice: 'Scrapper history was successfully updated.' }
        format.json { render :show, status: :ok, location: @scrapper_history }
      else
        format.html { render :edit }
        format.json { render json: @scrapper_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scrapper_histories/1
  # DELETE /scrapper_histories/1.json
  def destroy
    @scrapper_history.destroy
    respond_to do |format|
      format.html { redirect_to scrapper_histories_url, notice: 'Scrapper history was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scrapper_history
      @scrapper_history = ScrapperHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scrapper_history_params
      params.require(:scrapper_history).permit(:name, :url)
    end
end
