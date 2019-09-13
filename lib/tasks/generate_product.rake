namespace :product do
  desc '產生10筆樣本商品'
  task :generate => :environment do
    puts "generating products..."
    10.times { FactoryBot.create(:product) }
    puts "done"
  end
end