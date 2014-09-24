author_one   = Author.create! name: 'Luiz Cezer'
author_two   = Author.create! name: 'Dave Mustaine'
author_three = Author.create! name: 'James Hetfield'

category_one   = Category.create! name: 'Esportes'
category_two   = Category.create! name: 'Programação'
category_three = Category.create! name: 'Cultura'

words = %w(Metallica band Megadeth awesome concert the big four
           Dave Miojão James YEAH crowd Brazil Rock in Rio better
           rust in peace master of puppets gzuis Slayer Array Reign in Blood
           Creeping Master release new slipknto album Corey Taylor Metallica
           Massacatrion Anthrax Belladona Joey Jordison the new concert
           Exodus album Steve Zetro return to band now and Ghost bc is cool)

500.times do |index|
  puts "Creating: #{index + 1}"
  title_size, description_size = index.odd? ? [3, 20] : [2, 35]

  Post.create! title: words.shuffle.first(title_size).join(' ').titleize,
               description: words.shuffle.first(description_size).join(' ').camelize,
               author_id: Author.order('RANDOM()').first.id,
               category_id: Category.order('RANDOM()').first.id

end