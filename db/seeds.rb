require 'faker'

kev = User.create(email: "kev", password: "123")

con1 = Contact.create(name:"Mike", industry:"Finance",user_id: kev.id)
con2 = Contact.create(name:"Gentry", industry:"Technology",user_id: kev.id)
con3 = Contact.create(name:"Ben", industry:"Entertainment",user_id: kev.id)

com1 = Comment.create(content: "Mike has 2 kids, a wife and a dog.", user_id: kev.id, contact_id: con1.id)
com2 = Comment.create(content: "Mike Enjoys Red Wine", user_id: kev.id, contact_id: con1.id)
com3 = Comment.create(content: "Gentry enjoys music", user_id: kev.id, contact_id: con2.id)
com4 = Comment.create(content: "Gentry grew up in Texas", user_id: kev.id, contact_id: con2.id)
com5 = Comment.create(content: "Loves comedy", user_id: kev.id, contact_id: con3.id)
com6 = Comment.create(content: "Is greek and enjoys greek food.", user_id: kev.id, contact_id: con3.id)


15.times do
  Contact.create(
    user_id: kev.id,
    name: Faker::Name.first_name,
    industry: 'Technology'
    )
end

15.times do
  Contact.create(
    user_id: kev.id,
    name: Faker::Name.first_name,
    industry: 'Finance'
    )
end
@contacts = []
15.times do
  @contacts << Contact.create(
    user_id: kev.id,
    name: Faker::Name.first_name,
    industry: 'Entertainment'
    )
end


@contacts.each do |contact|
    Comment.create(
        content: Faker::Lorem,
        user_id: kev.id,
        contact_id: contact.id
        )
end
