# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# delete all data from the database
JobApplication.destroy_all
Comment.destroy_all
# Connection.destroy_all
# Event.destroy_all
# Hashtag.destroy_all
Job.destroy_all
Like.destroy_all
Post.destroy_all
User.destroy_all

# make 20 users

require "faker"

chain_list = ['Ethereum', 'Polygon', 'Solana', 'Binance Smart Chain', 'Avalanche', 'Fantom', 'Harmony', 'Kusama', 'Polkadot', 'Celo', 'Near', 'Tezos', 'Klaytn', 'Tron', 'Waves', 'EOS', 'Algorand', 'Stellar', 'Cardano', 'Other']

random_skills = [
  "Ruby",
  "Ruby on Rails",
  "JavaScript",
  "React",
  "Redux",
  "HTML",
  "CSS",
  "Git",
  "SQL",
  "PostgreSQL",
  "Python",
  "Java",
  "C",
  "C++",
  "C#",
  "PHP",
  "Go",
  "Swift",
  "Kotlin",
  "TypeScript",
  "R",
  "Objective-C",
  "Scala",
  "Rust",
  "Dart",
  "Elixir",
  "Assembly",
  "MATLAB",
  "Perl",
  "Lua",
  "Haskell",
  "Clojure",
  "Julia",
  "Groovy",
  "Visual Basic",
  "F#",
  "Erlang",
  "Ruby on Rails",
  "Laravel",
  "Django",
  "Spring",
  "Flask",
  "Express.js",
  "Vue.js",
  "AngularJS",
  "React.js",
  "Ember.js",
  "ASP.NET",
  "jQuery",
  "Ruby",
  "JavaScript",
  "Python",
  "Java",
  "PHP",
  "C#",
  "C++",
  "TypeScript",
  "C",
  "Shell",
  "C",
  "Go",
  "Scala",
  "Kotlin",
  "R",
  "Swift",
  "Objective-C",
  "Ruby on Rails",
  "Docker",
  "Android",
  "Spring",
  "React",
  "TensorFlow",
  "Angular",
  "Vue.js",
  "Node.js",
  "Apache Spark",
  "Pandas",
  "Ansible",
  "Terraform",
  "Apache Kafka",
  "Unity",
  "Xamarin",
  "Apache Hadoop",
  "Apache",
  "Cordova",
  "Flutter",
  "MongoDB",
  "Redis",
  "MySQL",
  "PostgreSQL",
  "Microsoft SQL Server",
  "SQLite",
  "Elasticsearch",
  "MariaDB",
  "Oracle",
  "Firebase",
  "Amazon DynamoDB",
  "Microsoft Access",
  "Cassandra",
  "Neo4j",
  "Couchbase",
  "Amazon Redshift",
  "Amazon Aurora",
  "Neo4j",
  "Apache Hive",
  "Apache HBase",
  "Apache Cassandra",
  "Apache CouchDB",
  "Apache",
  "Couchbase"
]

random_jobs = [
  "Software Engineer",
  "Senior Software Engineer",
  "Software Engineering Manager",
  "Senior Software Engineering Manager",
  "Technical Program Manager",
  "Senior Technical Program Manager",
  "Product Manager",
  "Senior Product Manager",
  "Product Designer",
  "Senior Product Designer",
  "UX Designer",
  "Senior UX Designer",
  "UX Researcher",
  "Senior UX Researcher",
  "Data Scientist",
  "Senior Data Scientist",
  "Data Analyst",
  "Senior Data Analyst",
  "User Acquisition Manager",
  "Senior User Acquisition Manager",
  "Marketing Manager",
  "Senior Marketing Manager",
  "Marketing Director",
  "Senior Marketing Director",
  "Account Manager",
  "Senior Account Manager",
  "Account Executive",
  "Senior Account Executive",
  "Sales Manager",
  "Senior Sales Manager",
  "Sales Director",
  "Senior Sales Director",
  "Business Development Manager",
  "Senior Business Development Manager",
  "Business Development Director",
  "Senior Business Development Director",
  "Finance Manager",
  "Senior Finance Manager",
  "Finance Director",
  "Senior Finance Director",
  "Finance Analyst",
  "Senior Finance Analyst",
  "Finance Accountant",
  "Senior Finance Accountant",
  "Operations Manager",
  "Senior Operations Manager",
  "Operations Director",
  "Senior Operations Director",
  "Operations Analyst",
  "Senior Operations Analyst",
  "Operations Accountant",
  "Senior Operations Accountant",
  "Human Resources Manager",
  "Senior Human Resources Manager",
  "Human Resources Director",
  "Senior Human Resources Director",
  "Human Resources Analyst",
  "Senior Human Resources Analyst",
  "Human Resources Accountant",
  "Senior Human Resources Accountant",
  "Customer Success Manager",
  "Senior Customer Success Manager",
  "Customer Success Director",
  "Senior Customer Success Director",
  "Customer Success Analyst",
  "Senior Customer Success Analyst",
  "Customer Success Accountant",
  "Senior Customer Success Accountant",
  "Customer Support Manager",
  "Senior Customer Support Manager",
  "Customer Support Director",
  "Senior Customer Support Director",
  "Customer Support Analyst",
  "Senior Customer Support Analyst",
  "Customer Support Accountant",
  "Senior Customer Support Accountant",
  "Data Engineer",
  "Senior Data Engineer",
  "Software Engineer",
  "Senior Software Engineer",
  "Software Engineering Manager",
  "Senior Software Engineering Manager",
]

random_experience = [
  "Software Engineer",
  "Senior Software Engineer",
  "Software Engineering Manager",
  "Senior Software Engineering Manager",
  "Technical Program Manager",
  "Senior Technical Program Manager",
  "Product Manager",
  "Senior Product Manager",
  "Product Designer",
  "Senior Product Designer",
  "UX Designer",
  "Senior UX Designer",
  "UX Researcher",
  "Senior UX Researcher",
  "Data Scientist",
  "Senior Data Scientist",
  "Data Analyst",
  "Senior Data Analyst",
  "User Acquisition Manager",
  "Senior User Acquisition Manager",
  "Marketing Manager",
  "Senior Marketing Manager",
  "Marketing Director",
  "Senior Marketing Director",
  "Account Manager",
  "Senior Account Manager",
  "Account Executive",
  "Senior Account Executive",
  "Sales Manager",
  "Senior Sales Manager",
  "Sales Director",
  "Senior Sales Director",
  "Business Development Manager",
  "Senior Business Development Manager",
  "Business Development Director",
  "Senior Business Development Director",
  "Finance Manager",
  "Senior Finance Manager",
  "Finance Director",
  "Senior Finance Director",
  "Finance Analyst",
  "Senior Finance Analyst",
  "Finance Accountant",
  "Senior Finance Accountant",
  "Operations Manager",
  "Senior Operations Manager",
  "Operations Director",
  "Senior Operations Director",
  "Operations Analyst",
  "Senior Operations Analyst",
  "Operations Accountant",
  "Senior Operations Accountant",
  "Human Resources Manager",
  "Senior Human Resources Manager",
  "Human Resources Director",
  "Senior Human Resources Director",
  "Human Resources Analyst",
  "Senior Human Resources Analyst",
  "Human Resources Accountant",
  "Senior Human Resources Accountant",
  "Customer Success Manager",
  "Senior Customer Success Manager",
  "Customer Success Director",
  "Senior Customer Success Director",
  "Customer Success Analyst",
  "Senior Customer Success Analyst",
  "Customer Success Accountant",
  "Senior Customer Success Accountant",
  "Customer Support Manager",
  "Senior Customer Support Manager",
  "Customer Support Director",
  "Senior Customer Support Director",
  "Customer Support Analyst",
  "Senior Customer Support Analyst",
  "Customer Support Accountant",
  "Senior Customer Support Accountant",
  "Data Engineer",
  "Senior Data Engineer",
]
20.times do
  User.create!(
    username: Faker::Internet.username,
    eth_address: Faker::Blockchain::Ethereum.address,
    eth_nonce: Faker::Crypto.sha256,
    headline: Faker::Quote.famous_last_words,
    profile_picture: Faker::Avatar.image,
    cover_picture: Faker::Avatar.image,
    summary: Faker::Quote.famous_last_words,
    experience: [random_experience.sample, random_experience.sample, random_experience.sample],
    job: [random_jobs.sample, random_jobs.sample, random_jobs.sample],
    skills: [random_skills.sample, random_skills.sample, random_skills.sample],
    website: Faker::Internet.url,
    twitter: Faker::Internet.url,
    discord: Faker::Internet.url
  )
end

puts "Created #{User.count} users"

# make 50 posts

50.times do
  Post.create!(
    user_id: User.all.sample.id,
    body: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 4)
  )
end

puts "Created #{Post.count} posts"

# make 50 jobs

50.times do
  Job.create!(
    user_id: User.all.sample.id,
    title: Faker::Job.title,
    project_name: Faker::Company.name,
    twitter_link: Faker::Internet.url,
    discord_invite: Faker::Internet.url,
    description: Faker::Quote.famous_last_words,
    chain: chain_list.sample,
  )
end

puts "Created #{Job.count} jobs"

# connect some users to users

# User.all.each do |user|
#   Connection.create!(
#     user_id: user.id,
#     connected_user_id: User.all.sample.id,
#     status: "accepted"
#   )
# end

# puts "Created #{Connection.count} connections"

# generate some likes

# Post.all.each do |post|
#   Like.create!(
#     user_id: User.all.sample.id,
#     post_id: post.id,
#     count: rand(1..10)
#   )
# end

# puts "Created #{Like.count} likes"

# generate some comments

Post.all.each do |post|
  Comment.create!(
    user_id: User.all.sample.id,
    post_id: post.id,
    body: Faker::Lorem.paragraph(sentence_count: 1, supplemental: true, random_sentences_to_add: 2)
  )
end

puts "Created #{Comment.count} comments"

# generate some applications

Job.all.each do |job|
  5.times do
    JobApplication.create!(
      user_id: User.all.sample.id,
      job_id: job.id,
      cover_letter: Faker::Lorem.paragraph(sentence_count: 1, supplemental: true, random_sentences_to_add: 2),
      resume_file_path: Faker::File.file_name(dir: 'path/to'),
      status: "pending"
    )
  end
end

puts "Created #{JobApplication.count} applications"

# generate some likes

50.times do
Like.create!(
  user_id: User.all.sample.id,
  post_id: Post.all.sample.id,
  likeable_type: "Post"
)
end

puts "Created #{Like.count} likes"
