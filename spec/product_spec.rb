require('spec_helper')

describe(Product) do
  it("validates presence of description") do
    product = Product.new({:description => ""})
    expect(product.save()).to(eq(false))
  end

  it("tells which purchase it belongs to") do
    purchase = Purchase.create({:date => "1992-01-05", :total => 200})
    product = Product.create({:description => "laxatives", :price => 200, :purchase_id => purchase.id()})
    expect(product.purchase()).to(eq(purchase))
  end

end
