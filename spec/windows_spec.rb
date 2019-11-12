

describe "Alternando janelas", :wnd do
  before(:each) do
    visit "/windows"
  end

  it "nova janela" do
    nova_janela = window_opened_by { click_link "Clique aqui" } #Função do capybara window_opened_by abre uma nova janela

    click_link "Clique aqui"

    within_window -> { page.title == "Nova Janela" } do # Nova Janela é o nome da tela (escrito na aba do navegador)
      expect(page).to have_content 'Aqui temos uma nova janela \o/'
    end

    nova_janela.close # fecha janela
    expect(nova_janela.closed?).to be true # verificando se a nova janela foi fechada
    sleep 3
  end
end
