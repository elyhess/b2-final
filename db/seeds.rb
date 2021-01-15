# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@hospital = Hospital.create(name: "hospital")
@surgery1 = Surgery.create(title: "surgery", day: "monday", operating_room_number: 1)
@surgery2 = Surgery.create(title: "surgery", day: "tuesday", operating_room_number: 1)
@surgery3 = Surgery.create(title: "surgery", day: "wednesday", operating_room_number: 1)
@surgery4 = Surgery.create(title: "surgery", day: "monday", operating_room_number: 1)

@doctor1 = @hospital.doctors.create(name: "A", specialty: "something", university: "CU")
@doctor2 = @hospital.doctors.create(name: "B", specialty: "xomething", university: "DU")

DoctorSurgery.create(doctor: @doctor2, surgery: @surgery)
DoctorSurgery.create(doctor: @doctor1, surgery: @surgery)