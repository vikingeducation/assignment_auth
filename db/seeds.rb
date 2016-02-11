User.destroy_all

User.create([{username: 'Kit', email: 'kit@kit.com', password: '123123123', password_confirmation: '123123123'}, {username: 'Sam', email: 'sam@sam.com', password: '123123123', password_confirmation: '123123123'}])
