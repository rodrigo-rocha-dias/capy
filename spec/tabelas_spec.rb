describe "tabelas", :tabs, :smoke do
  before(:each) do
    visit "/tables"
  end

  #   it "Paga o Tony Stark na lista" do
  #     expect(page).to have_content "Robert Downey Jr"
  #   end

  it "Deve exibir o salario do Stark" do
    atores = all("table tbody tr") # Achamos a tabela e suas filhas "tbody" e "tr"
    stark = atores.detect { |ator| ator.text.include?("Robert Downey Jr") }

    expect(stark.text).to include "10.000.000"
  end

  it "Deve exibir o salario do Vin Diesel" do
    diesel = find("table tbody tr", text: "@vindiesel")
    expect(diesel).to have_content "10.000.000"
  end

  #Usando o codigo acima, pode se usar o mesmo, mudando apenas o que quer comparar
  it "Deve exibir o filme velozes" do
    diesel = find("table tbody tr", text: "@vindiesel")
    expect(diesel).to have_content "Velozes e Furiosos"
  end

  #Verificar por coluna
  it "Deve exibir o filme velozes" do
    diesel = find("table tbody tr", text: "@vindiesel")
    movie = diesel.all("td")[2].text
    expect(movie).to eql "Fast and Furious"
  end

  it "Deve exibir o insta do Chris Evans" do
    evans = find("table tbody tr", text: "Chris Evans")
    insta = evans.all("td")[4].text

    expect(insta).to eql "@teamcevans"
  end

  it "deve selecionar Chris Prat para remoção" do
    prat = find("table tbody tr", text: "Chris Pratt")
    prat.find("a", text: "delete").click
    msg = page.driver.browser.switch_to.alert.text
    expect(msg).to eql "Chris Pratt foi selecionado para remoção!"
  end

  it "deve selecionar Chris Prat para edicao" do
    prat = find("table tbody tr", text: "Chris Pratt")
    prat.find("a", text: "edit").click
    msg = page.driver.browser.switch_to.alert.text
    expect(msg).to eql "Chris Pratt foi selecionado para edição!"
  end
end
