class GossipController < ApplicationController
  def show_gossip
    @id = params['id']
    @gossip = Gossip.find(@id)
    puts @gossip.title
  end
end
