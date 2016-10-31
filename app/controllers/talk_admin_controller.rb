class TalkAdminController < ApplicationController
  def scrape
    # delete all talks
    Talk.delete_all
    # generate new
    Scraper.scrape_all_talks
    redirect_to root_path
  end
end
