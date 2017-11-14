require('pry-byebug')
require('pp')
require_relative('bounty.rb')

alien1 = Bounty.new(
  {
    'name' => 'Predator',
    'species' => 'Yautja',
    'bounty' => '3000',
    'danger_level' => 'High'
  }
)
alien2 = Bounty.new(
  {
    'name' => 'Alien',
    'species' => 'Xenomorph',
    'bounty' => '2500',
    'danger_level' => 'Medium'
  }
)
alien3 = Bounty.new(
  {
    'name' => 'E.T.',
    'species' => 'Brodo Asogian',
    'bounty' => '100',
    'danger_level' => 'OMGWTFBBQ'
  }
)

alien1.save
alien2.save
alien3.save

pp Bounty.find_by_id(22)
#
# alien2.name = "Queen"
# alien2.update
#
# alien2.delete
