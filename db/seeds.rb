# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# delete all data from the database
require "open-uri"
require "json"

JobApplication.destroy_all
JobCategory.destroy_all
Company.destroy_all
Skill.destroy_all
Experience.destroy_all
Job.destroy_all
User.destroy_all

# make 20 users

require "faker"

chain_list = ["Ethereum", "Polygon", "Solana", "Binance Smart Chain", "Avalanche", "Fantom", "Harmony", "Kusama", "Polkadot", "Celo", "Near", "Tezos", "Klaytn", "Tron", "Waves", "EOS", "Algorand", "Stellar", "Cardano", "Other"]

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
  "Couchbase",
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

random_banners = [
  "https://images8.alphacoders.com/131/1318148.png",
  "https://images.alphacoders.com/131/1318416.png",
  "https://images.alphacoders.com/131/1318412.png",
  "https://images8.alphacoders.com/131/1318523.png",
  "https://images.alphacoders.com/131/1318300.png",
  "https://images.alphacoders.com/131/1317738.png",
  "https://images8.alphacoders.com/129/1298087.jpg",
  "https://images4.alphacoders.com/710/710501.png",
  "https://images8.alphacoders.com/131/1318410.png",
  "https://images4.alphacoders.com/129/1293106.png",
  "https://images.alphacoders.com/129/1291412.jpg",
  "https://images3.alphacoders.com/109/109509.jpg",
  "https://images3.alphacoders.com/116/1163420.jpg",
]

# make 20 users

puts "Creating users..."
5.times do
  user = User.new(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    headline: Faker::Quote.famous_last_words,
    password: "123456",
    summary: Faker::Quote.famous_last_words,
    cover_picture: random_banners.sample,
    website: Faker::Internet.url,
    twitter: Faker::Internet.url,
    discord: Faker::Internet.url,
  )
  user.profile_picture.attach(io: URI.open("https://i.pravatar.cc/150?img=#{rand(1..60)}"), filename: "#{user.first_name}.png", content_type: "image/png")
  user.save!
end
puts "Created #{User.count} users"

# let's retreive some companies from the api

url = "https://remote3.co/api/1.1/obj/company"
response = URI.open(url).read

json_comapnies = JSON.parse(response)

json_comapnies["response"]["results"].each do |company|
  Company.create!(
    name: company["name"],
    bio: company["bio"],
    slug: company["Slug"],
    website: company["company-website"],
    logo: company["logo"],
    banner: company["banner"],
    _id: company["_id"],
  )
end

puts "Created #{Company.count} companies"

# let's retreive some job categories from the api

url = "https://remote3.co/api/1.1/obj/category"
response = URI.open(url).read
json_categories = JSON.parse(response)

json_categories["response"]["results"].each do |category|
  JobCategory.create!(
    title: category["title"],
    slug: category["Slug"],
    index: category["index"],
    _id: category["_id"],
  )
end

puts "Created #{JobCategory.count} categories"
# let's retreive some jobs from the api

url = "https://remote3.co/api/1.1/obj/job"
response = URI.open(url).read
json_jobs = JSON.parse(response)
begin
  json_jobs["response"]["results"].each do |job|
    p "Creating a job for #{Company.where(_id: job["company"]).first.name}"
    jobmaking = Job.new(
      title: job["job-title"],
      description: job["job-description"],
      location: job["job-location"],
      job_type: job["job-type"],
      slug: job["Slug"],
      pay_in_crypto: job["pay_in_crypto"],
      payscale_max: job["payscale-max"],
      payscale_min: job["payscale-min"],
      isWorldwide: job["isWorldwide"],
      apply_url: job["apply-url"],
    )
    p Company.where(_id: job["company"]).first
    jobmaking.company  = Company.where(_id: job["company"]).first
    job["job-category"].each do |category|
      jobmaking.job_categories_id = JobCategory.where(_id: category).first
    end
    jobmaking.save!
    p "Saved #{jobmaking.title}"
  rescue Exception => e
    p "Broken #{e}"
  end
end
puts "Created #{Job.count} jobs"

# Job.all.each do |job|
#   5.times do
#     JobApplication.create!(
#       user_id: User.all.sample.id,
#       job_id: job.id,
#       status: "pending"
#     )
#   end
# end

# puts "Created #{JobApplication.count} applications"

# generate some likes

# 50.times do
# Like.create!(
#   user: User.all.sample.id,
#   post: Post.all.sample.id,
#   likeable_type: "Post"
# )
# end

# puts "Created #{Like.count} likes"

# generate skills to users

User.all.each do |user|
  3.times do
    Skill.create!(
      user_id: user.id,
      name: random_skills.sample,
    )
  end
end

puts "Created #{Skill.count} skills"

# generate experiences to users

User.all.each do |user|
  3.times do
    Experience.create!(
      user_id: user.id,
      title: random_experience.sample,
      company: Faker::Company.name,
      social_links: Faker::Internet.url,
      description: Faker::Quote.famous_last_words,
    )
  end
end
