require('pry-byebug')
require_relative('bounty')

bounty_hash1 = {
  'name' => 'Zorg',
  'species' => 'Klingon',
  'bounty_value' => '525',
  'collected_by' => 'Kirk'
}
bounty1 = Bounty.new(bounty_hash1)

bounty_hash2 = {
  'name' => 'Quark',
  'species' => 'Ferenghi',
  'bounty_value' => '339',
  'collected_by' => 'Khan'
}
bounty2 = Bounty.new(bounty_hash2)

bounty_hash3 = {
  'name' => 'Borg Queen',
  'species' => 'Borg',
  'bounty_value' => '221',
  'collected_by' => 'Spock'
}
bounty3 = Bounty.new(bounty_hash3)

p ""
p Bounty.delete_all()   # clear the database to start
p ""

bounty1.save()          # add the first two bounty records
bounty2.save()

p Bounty.get_all()      # return the first two bounty records
p ""

Bounty.delete_all()     # clear the database to start over

bounty1.save()          # resave first bounty

p ""
p Bounty.get_all()      # return the first bounty record to test delete function
p ""

bounty3.save()          # add in a new bounty record

p ""
p Bounty.get_all()
p ""

all_bounties = Bounty.get_all()   # return list of bounties
p all_bounties
p ""

first_bounty = all_bounties.first      # take the first bounty record
p first_bounty
first_bounty.name = "Sybok"            # adjust the record
first_bounty.update()                  # use update function to update record in the database

p ""
p Bounty.get_all()     # display the final list of bounty records
p
