# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Nation.destroy_all

nation_text = File.readlines(Rails.root.join('lib', 'seeds', 'nations.txt'))

nation_text.each do |line|
  line = line.chomp
  Nation.create!(name: line)
end


usa = Nation.find_by(name: "United States")


State.destroy_all

state_text = File.readlines(Rails.root.join('lib', 'seeds', 'states.txt'))


state_text.each do |line|
  line = line.chomp
  state_name = line.split(",").first[1...-1]
  State.create!(name: state_name, nation_id: usa.id)
end


City.destroy_all

city_text = File.readlines(Rails.root.join('lib', 'seeds', 'capitals.txt'))


city_text.each do |line|
  line = line.chomp
  state_name, city_name = line.split(", ")
  state = State.find_by(name: state_name)

  if city_name == "District of Columbia"
    capitable_id = usa.id
    capitable_type = "Nation"
  else
    capitable_id = state.id
    capitable_type = "State"
  end

  City.create!({
    name: city_name, state_id: state.id, capitable_id: capitable_id,
    capitable_type: capitable_type
  })
end
