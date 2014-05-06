require 'sinatra'
require 'json'
require 'mechanize'
require 'sinatra'
require 'sinatra/cross_origin'

class Mizu < Sinatra::Base
	register Sinatra::CrossOrigin
 
  	enable :cross_origin

	get '/:num' do |num|
		content_type :json
		m = Mechanize.new
		page = m.get 'http://www.sepomex.gob.mx/lservicios/seguimientopiezas/emsportal.aspx'
		form = page.form 'Form1'
		form.txtNGuia = num
		page = form.click_button(form.button_with(name: /btnFind/))
		rows = page.search("//table[@id='dg']/tr")
		limit = page.search("//span[@id='lblTot']").text[-1].to_i
		ret = Hash.new
		ret[:data] = []
		for r in 1..limit do
	 		columns = rows[r].search("./td")
	 		col = {fecha: columns[0].text.strip, origen: columns[2].text.strip, 
	 			accion: columns[3].text.strip, destino: columns[4].text.strip}
	 		ret[:data].push col
	 	end
		ret.to_json
	end
end