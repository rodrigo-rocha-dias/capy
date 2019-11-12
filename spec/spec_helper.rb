require "capybara"
require "capybara/rspec"
require "selenium-webdriver"

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.include Capybara::DSL

  # Resolução da tela
  config.before(:example) do # estamos deixando todas as telas com a resolução 1200 por 800
    page.current_window.resize_to(1920, 1200)
  end

  #ScreenShot
  config.after(:example) do |e| # Esse config salva o print das telas
    nome = e.description.gsub(/[^A-Za-z0-9 ]/, "").tr(" ", "_") #Expressao regular que subistitui caractere especial por nada
    page.save_screenshot("log/" + nome + ".png") if e.exception # "if e.exception" significa se tiver erro no cenario, ele tira print
  end
end

Capybara.configure do |config|
  #Testar no Chrome
  config.default_driver = :selenium_chrome

  # Testas com Headless = Navegador invisivel
  #config.default_driver = :selenium_chrome_headless #Executar testes com o navegador invisivel. Só colocar o headless no final

  #Testar no Firefox
  #config.default_driver = :selenium #Trabalha com o driver default que é o firefox

  #Tempo na tela
  config.default_max_wait_time = 5 # É uma propriedade do Capybara para definir quanto tempo o sistema vai aguardar para encontrar um elemento na tela

  # URL padrão pra testes
  config.app_host = "https://training-wheels-protocol.herokuapp.com" # Todos os seus testes vao usar esse caminho para abrir o navegador
end
