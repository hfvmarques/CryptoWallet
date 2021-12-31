namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner('Apagando DB...') { %x(rails db:drop) }
      show_spinner('Criando DB...') { %x(rails db:create) }
      show_spinner('Migrando DB...') { %x(rails db:migrate) }
      %x(rails dev:add_mining_types)
      %x(rails dev:add_coins)
    else
      puts "Você não está em ambiente de desenvolvimento!"    
    end    
  end

  desc "Cadastra as moedas"
  task add_coins: :environment do
    show_spinner('Cadastrando Moedas...') do
      seed_coins = [
        {
          description: "Bitcoin",
          acronym: "BTC",
          image_url: "https://imagensemoldes.com.br/wp-content/uploads/2020/09/%C3%8Dcone-Bitcoin-PNG.png",
          mining_type: MiningType.find_by(acronym: "PoW")
        },
        {
          description: "Ethereum",
          acronym: "ETH",
          image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Ethereum-icon-purple.svg/   480px-Ethereum-icon-purple.  svg.png",
          mining_type: MiningType.all.sample
        },
        {
          description: "Dash",
          acronym: "DASH",
          image_url: "https://cryptologos.cc/logos/dash-dash-logo.png",
          mining_type: MiningType.all.sample
        },
        {
          description: "Chiliz",
          acronym: "CHZ",
          image_url: "https://seeklogo.com/images/C/chiliz-chz-logo-605C6C40F6-seeklogo.com.png",
          mining_type: MiningType.all.sample
        },
        {
          description: "WiBX",
          acronym: "WBX",
          image_url: "https://shaihocah6sodeiqueriengu.wibx.io/wp-content/uploads/2021/08/icone-wiboo-transparente.png",
          mining_type: MiningType.all.sample
        },
        {
          description: "Riple",
          acronym: "XRP",
          image_url: "https://www.pngall.com/wp-content/uploads/12/Ripple-Coin-PNG-Free-Image.png",
          mining_type: MiningType.all.sample
        }
      ]

      seed_coins.each do |coin|
        Coin.find_or_create_by!(coin)  
      end
    end
  end

  desc "Cadastra os tipos de mineração"
  task add_mining_types: :environment do
    show_spinner('Cadastrando Tipos de Mineração...') do
      seed_mining_types = [
        {
          description: "Proof of Work",
          acronym: "PoW"
        },
        {
          description: "Proof of Stake",
          acronym: "PoS"
        },
        {
          description: "Proof of Capacity",
          acronym: "PoC"
        }
      ]

      seed_mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)  
      end
    end
  end

  
  private
  def show_spinner(start_msg, end_msg = 'Concluído!')
    spinner = TTY::Spinner.new("[:spinner] #{start_msg}", format: :bouncing)
    spinner.auto_spin
    yield
    spinner.success(end_msg)  
  end
  
end
