kev = User.create(email: "kev", password: "123")

con1 = Contact.create(name:"Mike Lebowitz", industry:"finance",user_id: kev.id)
con2 = Contact.create(name:"Gentry Norman", industry:"technology",user_id: kev.id)
con3 = Contact.create(name:"Ben Stiller", industry:"entertainment",user_id: kev.id)

com1 = Comment.create(content: "Mike has 2 kids, a wife and a dog.", user_id: kev.id, contact_id: con1.id)
com2 = Comment.create(content: "Mike Enjoys Red Wine", user_id: kev.id, contact_id: con1.id)
com3 = Comment.create(content: "Gentry enjoys music", user_id: kev.id, contact_id: con2.id)
com4 = Comment.create(content: "Gentry grew up in Texas", user_id: kev.id, contact_id: con2.id)
com5 = Comment.create(content: "Loves comedy", user_id: kev.id, contact_id: con3.id)
com6 = Comment.create(content: "Is greek and enjoys greek food.", user_id: kev.id, contact_id: con3.id)
