require 'sinatra'
require 'json'
require 'mechanize'

m = Mechanize.new
page = m.get 'http://www.sepomex.gob.mx/lservicios/seguimientopiezas/emsportal.aspx'
form = page.form 'Form1'

get '/:number' do
	content_type :json
	form.txtNGuia = :number.to_s
	page = form.click_button(form.button_with(name: /btnFind/))
	rows = page.search("//table[@id='dg']/tr")
	limit = page.search("//span[@id='lblTot']").text[-1].to_i
	ret = {data: []}
	for r in 1..limit do
 		columns = rows[r].search("./td")
 		col = {fecha: columns[0].text, origen: columns[2].text, 
 			accion: columns[3].text, destino: columns[4].text}
 		ret[:data].push col
 	end
 	ret
end