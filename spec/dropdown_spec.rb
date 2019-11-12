

describe "Caixa de opções", :dropdown do #tag dropdown
  it "Item especifico simples" do
    visit "/dropdown"
    select("Loki", from: "dropdown") #dropdown = ID na tela / só funciona quando tem ID na tela
    sleep (3) # temporrio
  end

  it "Item especifico com o find" do
    visit "/dropdown"
    drop = find(".avenger-list") #Class = avanger-list
    drop.find("option", text: "Bucky").select_option #Vai buscar a opção que foi selecionada
    sleep (3)
  end

  it "Qualquer item", :sample do
    visit "/dropdown"
    drop = find(".avenger-list")
    drop.all("option").sample.select_option #metodo "sample" sorteia os elementos
    sleep (3)
  end
end
