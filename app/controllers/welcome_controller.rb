# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    @google_maps_url = 'https://goo.gl/maps/Cd9kNRrWZcqsdZok6'
    @party_url = 'https://goo.gl/maps/8XQ533kjxabYfh2x5'

    @cool_earth_url = serve_welcome_pdf_url
  end

  def serve_pdf
    pdf_filename = Rails.root.join('app/assets/pdfs/cuentas.pdf')
    send_file(pdf_filename, filename: "cuentas.pdf", type: "application/pdf")
  end

end
