namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      spinner = TTY::Spinner.new("[:spinner] Apagando DB...", format: :bouncing)
      spinner.auto_spin
      %x(rails db:drop)
      spinner.success()

      spinner = TTY::Spinner.new("[:spinner] Criando DB...", format: :bouncing)
      spinner.auto_spin
      %x(rails db:create)
      spinner.success()

      spinner = TTY::Spinner.new("[:spinner] Migrando DB...", format: :bouncing)
      spinner.auto_spin
      %x(rails db:migrate)
      spinner.success()

      spinner = TTY::Spinner.new("[:spinner] Seedando DB...", format: :bouncing)
      spinner.auto_spin
      %x(rails db:seed)
      spinner.success()  
    else
      puts "Você não está em ambiente de desenvolvimento!"    
    end    
  end
end
