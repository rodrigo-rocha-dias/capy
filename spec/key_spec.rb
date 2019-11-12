
describe "Teclado", :key do
  before(:each) do
    visit "/key_presses"
  end

  it "enviando teclas" do
    teclas = %i[tab escape space enter shift control alt] # %i pra criar um array de simbolos

    teclas.each do |t|
      find("#campo-id").send_keys t
      expect(page).to have_content "You entered: " + t.to_s.upcase
      sleep 1
    end
  end

  # ou
  # find("#campo-id").send_keys :space
  # sleep 5

  # expect(page).to have_content "You entered: SPACE"

  it "enviando letras" do
    letras = %w[a s d f g h j k l] # %w pra criar um array de strings

    letras.each do |l|
      find("#campo-id").send_keys l
      expect(page).to have_content "You entered: " + l.to_s.upcase
      sleep 1
    end
  end
end
