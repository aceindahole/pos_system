require('spec_helper')

describe(Purchase) do
  it("tells which products were purchased") do
    purchase = Purchase.create({:date => "1987-05-23", :total => 500})
    product1 = Product.create({:description => "dogs", :price => 400, :purchase_id => purchase.id()})
    product2 = Product.create({:description => "kitties", :price => 100, :purchase_id => purchase.id()})
    expect(purchase.products()).to(eq([product1, product2]))
  end

  

end
