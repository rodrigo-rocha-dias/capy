
describe "Upload", :upload do
  before(:each) do
    visit "/upload"
    @arquivo = Dir.pwd + "/spec/fixtures/arquivo_teste.txt" # pdw metodo que invoca o diretorio que esta o arquivo
    @imagem = Dir.pwd + "/spec/fixtures/imagem_teste.jpg" # pdw metodo que invoca o diretorio que esta o arquivo
  end

  it "upload com arquivo texto" do
    attach_file("file-upload", @arquivo)
    # puts @arquivo # Ela precisa se uma variavel instancia para funcionar, por isso o @ na frente da variavel
    click_button "Upload" # pegando o value do botao na tela que chama "Upload"

    div_arquivo = find("#uploaded-file")
    expect(div_arquivo.text).to eql "arquivo_teste.txt"
  end

  it "upload de imagem", :upload_img do
    attach_file("file-upload", @imagem)
    click_button "Upload"

    img = find("#new-image")
    expect(img[:src]).to include "/uploads/imagem_teste.jpg"
  end

  after(:each) do
    sleep 3
  end
end
