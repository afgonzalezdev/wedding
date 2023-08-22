# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    @google_maps_url = 'https://goo.gl/maps/Cd9kNRrWZcqsdZok6'
    @party_url = 'https://goo.gl/maps/8XQ533kjxabYfh2x5'

    @cool_earth_url = 'https://www.google.com/'
  end
end
