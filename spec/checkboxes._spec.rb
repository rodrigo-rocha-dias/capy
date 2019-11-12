

describe "Caixas de seleção", :checkbox do
  before(:each) do
    visit "/checkboxes"
  end

  it "marcando uma opção" do
    check("thor") #Check e Uncheck é usado apenas para ID e Name
  end

  it "desmarcando uma opção" do
    uncheck("antman") #Check e Uncheck é usado apenas para ID e Name
  end

  it "mancando com find set true" do
    find("input[value = cap]").set(true) # Buscar por VALUE na pagina (quando nao tem ID e Name)
  end

  it "desmancando com find set false" do
    find("input[value = guardians]").set(false) # Buscar por VALUE na pagina (quando nao tem ID e Name)
  end

  after(:each) do
    sleep 3
  end
end
