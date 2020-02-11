class StaticController < ApplicationController
  def index
    @gossips = Gossip.all
  end

  def team
    #dire d'aller dans la view
  end

  def contact

  end
end
