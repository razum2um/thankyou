require 'net/http'

class ImagesController < ApplicationController
  def index
    q = params[:q].to_s
    #render(json: {}) and return if q.size < 3
    q = ['cats', 'kitten'].shuffle.first # unless q

    query  = {
      v: '1.0', rsz: 8, imgsz: 'huge', safe: 'active', as_rights: 'cc_noncommercial',
      as_sitesearch: 'flickr.com', as_filetype: '(jpg|png)',
      q: q, start: 10.times.map { |i| 8*i } .shuffle.first
    }
    query['userip'] = request.remote_ip unless localhost?
    uri = URI::HTTP.build(
      host: 'ajax.googleapis.com',
      path: '/ajax/services/search/images',
      query: query.to_query
    )

    json = Rails.cache.fetch(uri, expires_in: 1.minute) do
      ::Net::HTTP.get(uri)
    end

    render json: json
  end
end
