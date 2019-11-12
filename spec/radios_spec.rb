
describe "Botoes de radio", :radio do
  before(:each) do
    visit "/radios"
  end

  it "seleção por ID" do
    choose("cap")
  end

  it "seleção por find e css selector" do
    find("input[value=guardians]").click # vamos usar o VALUES para buscar na tela
  end

  after(:each) do
    sleep 3
  end
end
