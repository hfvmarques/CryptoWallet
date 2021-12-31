# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

seed_coins = [
  {
    description: "Bitcoin",
    acronym: "BTC",
    image_url: "https://imagensemoldes.com.br/wp-content/uploads/2020/09/%C3%8Dcone-Bitcoin-PNG.png"
  },
  {
    description: "Ethereum",
    acronym: "ETH",
    image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Ethereum-icon-purple.svg/480px-Ethereum-icon-purple.svg.png"
  },
  {
    description: "Dash",
    acronym: "DASH",
    image_url: "https://cryptologos.cc/logos/dash-dash-logo.png"
  },
  {
    description: "Chiliz",
    acronym: "CHZ",
    image_url: "https://seeklogo.com/images/C/chiliz-chz-logo-605C6C40F6-seeklogo.com.png"
  },
  {
    description: "WiBX",
    acronym: "WBX",
    image_url: "https://shaihocah6sodeiqueriengu.wibx.io/wp-content/uploads/2021/08/icone-wiboo-transparente.png"
  },
  {
    description: "Riple",
    acronym: "XRP",
    image_url: "https://www.pngall.com/wp-content/uploads/12/Ripple-Coin-PNG-Free-Image.png"
  }
]

seed_coins.each do |coin|
  Coin.find_or_create_by!(coin)  
end
