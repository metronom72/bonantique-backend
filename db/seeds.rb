# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

contacts = [
    Contact.new(
        link: 'https://instagram.com',
        label: 'Instagram',
        value: 'Instagram',
        scope: 'socials',
    ),
    Contact.new(
        link: 't.me/onepunchman_ep',
        label: 'Telegram',
        value: 'Telegram',
        scope: 'socials',
    ),
    Contact.new(
        link: 'https://vk.com',
        label: 'VK',
        value: 'VK',
        scope: 'socials',
),
Contact.new(
    link: 'tel:+79999999999',
    label: '+79999999999',
    value: '+79999999999',
    scope: 'phone',
),
    Contact.new(
        link: 'mailto:admin@bon-antique.com',
        label: 'Support',
        value: 'admin@bon-antique.com',
        scope: 'email',
    ),
]
contacts.each{|contact| contact.save!}