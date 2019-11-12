

describe "login com cadastro", :login3 do
  before(:each) do
    visit "/access"
  end

  it "login com sucesso" do

    # login_form = find("#login")

    # login_form.find("input[name=username]").set "stark"
    # login_form.find("input[name=password]").set "jarvis!"

    # OU

    within("#login") do
      find("input[name=username]").set "stark"
      find("input[name=password]").set "jarvis!"
      click_button "Entrar"
    end

    # click_button "Entrar" Usar quando descomentar o codigo acima que começa com "login_form = find("#login")"
    expect(find("#flash")).to have_content "Olá, Tony Stark. Você acessou a área logada!"
  end

  it "Cadastro com sucesso" do
    within("#signup") do
      find("input[name=username]").set "Rodrigo"
      find("input[name=password]").set "123456"
      click_link "Criar Conta"
    end

    expect(find("#result")).to have_content "Dados enviados. Aguarde aprovação do seu cadastro!"
  end
end
