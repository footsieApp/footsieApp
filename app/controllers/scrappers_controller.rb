class ScrappersController < ApplicationController
  before_action :set_scrapper, only: [:show, :edit, :update, :destroy]
  require 'open-uri'

  # GET /scrappers
  # GET /scrappers.json
  def index
    @scrappers = Scrapper.all
  end

  # GET /scrappers/1
  # GET /scrappers/1.json
  def show
  end

  # GET /scrappers/new
  def new
    @scrapper = Scrapper.new
  end

  # GET /scrappers/1/edit
  def edit
  end

  # POST /scrappers
  # POST /scrappers.json
  def create
    @scrapper = Scrapper.new(scrapper_params)
    @scrapper.save
    # f = File.open(Dir.pwd+"/Additional Docs/SportsPages/BBC Test Data.html")
    # f = File.open(Dir.pwd+@scrapper.url)
    # doc = Nokogiri::HTML(f)
    doc = Nokogiri::HTML(open(@scrapper.url))
    
    competition = Competition.find_or_create_by(name: scrapper_add_params[:competition])

    dateArray = doc.css('table.table-stats')#Date is contain in a super class
    dateArray.each do |dateElement|
      matchArray = dateElement.css('tr.preview')#Get all the match instances for the date
      split_date = dateElement.css('caption').text[38..-1].split
      year = split_date[3].to_i
      month = DateTime::MONTHNAMES.index(split_date[2])
      day = split_date[1][0...-2].to_i
      matchArray.each do |matchElement|
        
        hometeam = Team.find_or_create_by(name: matchElement.css('.team-home a').text.strip)
        awayteam = Team.find_or_create_by(name: matchElement.css('.team-away a').text.strip)

        kickoff = matchElement.css('.kickoff').text.strip
        hour = kickoff[0...-3].to_i
        minute = kickoff[-2..-1].to_i

        fixture = Fixture.find_or_create_by(hometeam_id: hometeam.id, awayteam_id: awayteam.id, competition_id: competition.id )
        fixture.date = DateTime.new(year,month,day,hour,minute,0)
        fixture.scrapper_id = @scrapper.id

        fixture.save
      end
    end
    # f.close
    respond_to do |format|
      if @scrapper.save
        format.html { redirect_to @scrapper, notice: 'Scrapper history was successfully created.' }
        format.json { render :show, status: :created, location: @scrapper }
      else
        format.html { render :new }
        format.json { render json: @scrapper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scrappers/1
  # PATCH/PUT /scrappers/1.json
  def update
    respond_to do |format|
      if @scrapper.update(scrapper_params)
        format.html { redirect_to @scrapper, notice: 'Scrapper was successfully updated.' }
        format.json { render :show, status: :ok, location: @scrapper }
      else
        format.html { render :edit }
        format.json { render json: @scrapper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scrappers/1
  # DELETE /scrappers/1.json
  def destroy
    @scrapper.destroy
    if @scrapper.fixtures.present?
      @scrapper.fixtures.destroy
    end

    respond_to do |format|
      format.html { redirect_to scrappers_url, notice: 'Scrapper was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scrapper
      @scrapper = Scrapper.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scrapper_params
      params.require(:scrapper).permit(:name, :url)
    end

    def scrapper_add_params
      params.require(:scrapper).permit(:competition)
    end
end
