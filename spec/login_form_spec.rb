

# describe "Forms" do
#   it "login com sucesso" do
#     visit "https://www2.genialinvestimentos.com.br/login"

#     fill_in "email", with: "rodrigo.rocha.dias@hotmail.com" #fill_in é usado tanto para ID ou name

#     click_button "3 ou 6"
#   end
# end

describe "Forms", :smoke do
  it "Login com sucesso" do
    visit "/login"

    fill_in "username", with: "stark" #username = usa o atributo name
    fill_in "password", with: "jarvis!" #password = usa o atributo name

    click_button "Login" #login está escrito na pagina
    expect(find("#flash").visible?).to be true #flash é o ID da pagina

    #expect(find("#flash").text).to include "Olá, Tony Stark. Você acessou a área logada!"
    #ou
    expect(find("#flash")).to have_content "Olá, Tony Stark. Você acessou a área logada!"

    # page.save_screenshot('log/login_com_sucesso.png') # dar print da tela
  end

  it "senha incorreta" do
    visit "/login"

    fill_in "username", with: "stark"
    fill_in "password", with: "jarvis!222"

    click_button "Login"
    expect(find("#flash").visible?).to be true
    expect(find("#flash")).to have_content "Senha é invalida!"
  end

  it "usuário não cadastrado" do
    visit "/login"

    fill_in "username", with: "rodrigo"
    fill_in "password", with: "jarvis!"

    click_button "Login"
    expect(find("#flash").visible?).to be true
    expect(find("#flash")).to have_content "O usuário informado não está cadastrado!"
  end

  
end
