class EditorController < ApplicationController
  protect_from_forgery with: :null_session

  def home
  end

  def index
  	cargaplantilla = Cargaplantilla.all 	
  end

  def plantillatext

  	cargaplantilla = Cargaplantilla.find(params[:id])
  	ruta = cargaplantilla.file.to_s
  	ruta = ruta[1, ruta.length - 12]
  	ruta = File.absolute_path(Rails.root.join(Rails.root,'public',ruta))

  	file = File.open(ruta, "rb")
  	file = file.read
  	file = file.gsub(/\s/, ' ')

  	respond_to do |format|
  		format.json { render json: { plantilla: file, titulo: cargaplantilla.titulo} } 
  	end

  end

  def plantillasave

  	cargaplantilla = Cargaplantilla.find(params[:id])
  	ruta = cargaplantilla.file.to_s
  	ruta = ruta[1, ruta.length - 12]
  	ruta = File.absolute_path(Rails.root.join(Rails.root,'public',ruta))

  	File.open(ruta, "w") do |file|
  		file.puts params[:vista]
  	end
  	  
  	render json: { estado: 'vista guardada', vista: params[:vista] }
  end

end