# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post, :class => 'Post' do
    title 'Random title'
    description %w(Metallica band Megadeth awesome concert the big four
           Massacatrion Anthrax Belladona Joey Jordison the new concert
           Exodus album Steve Zetro return to band now and Ghost bc is cool).shuffle.join(' ')

    category
    author
  end
end
