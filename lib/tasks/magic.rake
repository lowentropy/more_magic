namespace :magic do
  desc "Refresh card index from http://magiccards.info/"
  task :refresh => :environment do
    CardGroup.refresh
  end
end