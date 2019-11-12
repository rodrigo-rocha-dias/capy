

describe "IDs Dinamicos", :ids_dinamicos do
  before(:each) do
    visit "/access"
  end

# $ => termina com
# ^ => começa com
# * => contem

  it "Cadastro" do

    # select elemento from html where id like 'UsernameInput' (ideia de como seria feito com codigo SQL)
    find("input[id$=UsernameInput]").set "Rodrigo"
    # ou
    #find("#PortalTheme_wt10_block_wtcontent_holder_wt8_wtUsernameInput").set "Rodrigo"

    # ou
    find("input[id^=PasswordInput]").set "123456"
    #find("#PasswordInput_wt11_PortalTheme_wt7_block_wtcontent_holder_wt8_wt").set "123456"

    # ou
    find("a[id*=GetStartedButton]").click
    #find("#PortalTheme_wt4_block_wtGetStartedButton_wtcontent_holder_OSCore_wt3_block").click

    expect(page).to have_content "Dados enviados. Aguarde aprovação do seu cadastro!"
    sleep 3
  end
end
