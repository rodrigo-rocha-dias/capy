

describe "iframes" do
  describe "bom", :nice_iframe do
    before(:each) do
      visit "/nice_iframe"
    end

    it "adicionar ao carrinho" do
      within_frame("burgerId") do
        produto = find(".menu-item-info-box", text: "REFRIGERANTE")
        produto.find("i").click
        expect(find("#cart")).to have_content "R$ 4,50"
        sleep 5
      end
    end
  end

  # Primeira coisa: PEDIR PRO DESENVOLVEDOR COLOCAR ID NO IFRAME :D
  describe "ruim", :bad_iframe do
    before(:each) do
      visit "/bad_iframe"
    end
    it "Carrinho deve estar vazio" do
      # Criar um ID temporario no console do navegador (Ex: $('.box-iframe').attr('id','tempId');)
      script = '$("".box-iframe").attr("id", "tempId");' # Isto é uma sting, mas é um script de Jquery. Estamos usando um Jquery para add um ID
      page.execute_script(script)

      within_frame("tempId") do # Passei o ID temporario que criei no console do navegador
        expect(find("#cart")).to have_content "Seu carrinho está vazio!"
        sleep 3
      end
    end
  end
end
