

# describe "meu primeiro script", :hello, :smoke do
#   it "visitar a pagina" do
#     visit "https://www.genialinvestimentos.com.br/"
#     expect(page.title).to eql "Genial Investimentos | A Sua Plataforma de Investimentos Online"
#   end
# end

describe "meu primeiro script", :hello, :smoke do
  

  it "visitar a pagina" do
    visit "/"
    expect(page.title).to eql "Training Wheels Protocol"
  end
end
