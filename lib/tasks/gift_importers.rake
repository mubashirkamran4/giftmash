require 'csv'

namespace :gift_importers do
  desc "imports the gifts from gifts.csv file in db/data"
  task import_gifts_from_csv: :environment do
    puts "STARTNG TO IMPORT GIFTS FROM gifts.csv file"
    CSV.foreach("db/data/gifts.csv", encoding: "iso-8859-1:utf-8", headers: true, col_sep: ";", header_converters: proc {|header| header.downcase.strip}) do |gift_row|
      puts "*******"
      puts "IMPORTING GIFT #{gift_row}"
      gift = Gift.find_or_initialize_by(name: gift_row["name"].strip)
      gift.assign_attributes(image_url: gift_row["image_url"].strip, url: gift_row["url"].strip)
      if gift.save
        puts "Gift with name:#{gift.name}, image_url: #{gift.image_url} and url: #{gift.url} created"
      else
        puts "Error in creating/updating gift #{gift_row} with errors #{gift.errors.full_messages.join(', ')}"
      end
      puts "*******"
    end
    puts "GIFTS IMPORTED"
  end
end
