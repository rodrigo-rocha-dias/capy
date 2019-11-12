describe "Mouse Hovers", :hovers do
  before(:each) do
    visit "/hovers"
  end

  it "quando passo o mouse sobre o blade" do
    # card = find("img[alt=Blade]")
    # ou
    card = find("img[alt*=Blade]")
    card.hover

    expect(page).to have_content "Nome: Blade"
  end

  it "quando passo o mouse sobre o pantera negra" do
    # card = find('img[alt="Pantera Negra"]') # quando tem espaço no nome Ex. Pantera Negra, tem que colocar '' no nome
    # ou
    card = find("img[alt^=Pantera]")
    card.hover

    expect(page).to have_content "Pantera Negra"
  end

  it "quando passo o mouse sobre o homem aranha" do
    # card = find('img[alt="Homem Aranha"]') # quando tem espaço no nome Ex. Pantera Negra, tem que colocar '' no nome
    # ou
    card = find("img[alt$=Aranha]")
    card.hover

    expect(page).to have_content "Homem Aranha"
  end

  after(:each) do
    sleep 0.5
  end
end
