# Create a main sample user.
User.create!(name: "Example User",
	     email: "example@railstuorial.org",
	     password: 		"fobar",
	     password_confirmation: "foobar",
	     admin: true)


# Generte a bunch of additional uses.
99.times do |n|
	name = Faker::Name.name
	email = "example-#{n+1}@ralstutorial.org"
	password = "password"
	User.create!(name: name,
		     email: email,
		     password: 		password,
		     password_confirmation: password)
end
