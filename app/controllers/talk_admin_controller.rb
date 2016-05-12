class TalkAdminController < ApplicationController
  def scrape
    # delete all talks
    Scraper.scrape_all_talks
    redirect_to root_path
  end
end
