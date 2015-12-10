# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = [ "antiques", "appliances", "arts+crafts", "atv/utv/sno", "auto parts",
      "baby+kid", "barter", "beauty+hlth", "bikes", "boats", "books", "business",
      "cars+trucks", "cds/dvd/vhs", "cell phones", "clothes+acc", "collectibles",
      "computers", "electronics", "farm+garden", "free", "furniture", "garage sale",
      "general", "heavy equip", "household", "jewelry", "materials", "motorcycles",
      "music instr", "photo+video", "rvs+camp", "sporting", "tickets", "tools",
      "toys+games", "video gaming", "room"]

categories.each do |category|
  c = Category.new(body: category)
  c.save
end
