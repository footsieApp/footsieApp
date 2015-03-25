class ScrapperHistoriesController < ApplicationController
  before_action :set_scrapper_history, only: [:show, :edit, :update, :destroy]

  def scrape_local
    f = File.open(Dir.pwd+"/Additional Docs/SportsPages/BBC Test Data.html")
    doc = Nokogiri::HTML(f)
    
    scrapperhis = ScrapperHistory.new
    scrapperhis.name = "First Auto run"
    scrapperhis.url = "httpmyass"
    
    competition = Competition.find_or_create_by(name: "FA Cup")
#Saturday 16th May 2015 15:00
    dateArray = doc.css('table.table-stats')#Date is contain in a super class
    dateArray.each do |dateElement|
      matchArray = dateElement.css('tr.preview')#Get all the match instances for the date
      split_date = dateElement.css('caption').text[38..-1].split
      year = split_date[3].to_i
      month = DateTime::MONTHNAMES.index(split_date[2])
      day = split_date[1][0...-2].to_i
      matchArray.each do |matchElement|
        fixture = Fixture.new
        hometeam = Team.find_or_create_by(name: matchElement.css('.team-home a').text.strip)
        awayteam = Team.find_or_create_by(name: matchElement.css('.team-away a').text.strip)

        kickoff = matchElement.css('.kickoff').text.strip
        hour = kickoff[0...-3].to_i
        minute = kickoff[-2..-1].to_i

        fixture.date = DateTime.new(year,month,day,hour,minute,0)
        fixture.competition_id = competition.id
        fixture.hometeam_id = hometeam.id
        fixture.awayteam_id = awayteam.id
        fixture.scrapper_history_id = scrapperhis.id
        
        fixture.save
      end
    end
    f.close
    scrapperhis.save
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
