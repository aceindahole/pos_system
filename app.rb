require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("sinatra/activerecord")
require("./lib/product")
require("./lib/purchase")
require("pg")
require("pry")

get('/') do
  erb(:index)
end

get('/manager') do
  @products = Product.all()
  erb(:manager)
end

get('/cashier') do
  date = params.fetch("date")
  purchase = Purchase.create({:date => date, :total => iunno yet })
  @products = Product.all()
    @products.each() do |product|
      if checked_product == product.description()
        poop = Product.create({:description = product.description(), :price => product.price(), :product_id => purchase.id()})
      end
    end
  @products = Product.all()
  erb(:cashier)
end

post('/manager') do
  description = params.fetch("description")
  price = params.fetch("price")
  @product = Product.create({:description => description, :price => price})
  @products = Product.all()
  erb(:manager)
end

get ('/manager/:id') do
  @product = Product.find(params.fetch("id").to_i())
  @products = Product.all()
  erb(:product_edit)
end

get('/manager/:id/edit') do
  @product = Product.find(params.fetch("id").to_i())
  redirect('/manager')
end

patch('/manager/:id') do
  description = params.fetch("description")
  price = params.fetch("price")
  @product = Product.find(params.fetch("id").to_i())
  @product.update({:description => description, :price => price})
  @products = Product.all()
  erb(:manager)
end
