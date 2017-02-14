# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
u1 = User.create(username: 'wade')
u2 = User.create(username: 'alec')

Contact.destroy_all
c1 = Contact.create(name: 'contact_1', email: '1@xyz.com', user_id: u1.id)
c2 = Contact.create(name: 'contact_2', email: '2@xyz.com', user_id: u2.id)

ContactShare.destroy_all
cs1 = ContactShare.create(contact_id: c1.id, user_id: u2.id)
cs2 = ContactShare.create(contact_id: c2.id, user_id: u1.id)
