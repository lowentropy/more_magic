namespace :magic do
  desc "Refresh card index from http://magiccards.info/"
  task :refresh => :environment do
    CardGroup.refresh
  end
  
  desc "Refresh card prices for all cards"
  task :prices => :environment do
    Price.refresh_all!
  end
end
