# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Coin.create!(
  description: "Bitcoin",
  acronym: "BTC",
  image_url: "https://imagensemoldes.com.br/wp-content/uploads/2020/09/%C3%8Dcone-Bitcoin-PNG.png"
)

Coin.create!(
  description: "Ethereum",
  acronym: "ETH",
  image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Ethereum-icon-purple.svg/480px-Ethereum-icon-purple.svg.png"
)

Coin.create!(
  description: "Dash",
  acronym: "DASH",
  image_url: "https://cryptologos.cc/logos/dash-dash-logo.png"
)