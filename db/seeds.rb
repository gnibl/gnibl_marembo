# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
User.delete_all

User.create(
 :full_name => 'marembo ochieng',
 :current_city => 'nairobi', 
 :email => 'marembo2008@gmail.com', 
 :username => 'maress'
)
User.create(
 :full_name => 'kennedy munene',
 :current_city => 'mombasa',
 :email => 'kennmunene@gmail.com',
 :username => 'kmunene'
)
User.create(
 :full_name => 'Gloria Alice',
 :current_city => 'nakuru',
 :email => 'gloria.alice@gmail.com',
 :username => 'glooh'
)
User.create(
 :full_name => 'erick oyugi',
 :current_city => 'nairobi',
 :email => 'ohuguy@gmail.com',
 :username => 'gwara'
)
