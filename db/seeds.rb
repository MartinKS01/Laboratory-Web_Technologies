Treatment.destroy_all
Appointment.destroy_all
Pet.destroy_all
Vet.destroy_all
Owner.destroy_all

owner1 = Owner.create!(
  first_name: "Martin",
  last_name: "Karl",
  email: "martin@email.com",
  phone: "934741283",
  address: "Cristobal colon 123, Santiago"
)

owner2 = Owner.create!(
  first_name: "Sofia",
  last_name: "Torres",
  email: "sofia@email.com",
  phone: "986482163",
  address: "av. la plaza 132, Valparaiso"
)

owner3 = Owner.create!(
  first_name: "Diego",
  last_name: "Morales",
  email: "diego@email.com",
  phone: "938902751",
  address: "aysen 123, Concepcion"
)

vet1 = Vet.create!(
  first_name: "Ana",
  last_name: "Garcia",
  email: "ana@vetclinic.com",
  phone: "998143276",
  specialization: "General Practice"
)

vet2 = Vet.create!(
  first_name: "Carlos",
  last_name: "Lopez",
  email: "carlos@vetclinic.com",
  phone: "908154761",
  specialization: "Surgery"
)
#Fecha = Año-mes-dia

pet1 = owner1.pets.create!(
  name: "Max",
  species: "Dog",
  breed: "Labrador",
  date_of_birth: "2019-03-15",
  weight: 28.5
)

pet2 = owner1.pets.create!(
  name: "Luna",
  species: "Cat",
  breed: "Siamese",
  date_of_birth: "2021-07-20",
  weight: 4.2
)

pet3 = owner2.pets.create!(
  name: "Coco",
  species: "Rabbit",
  breed: "Holland Lop",
  date_of_birth: "2022-01-10",
  weight: 1.8
)

pet4 = owner2.pets.create!(
  name: "Lupe",
  species: "Dog",
  breed: "Borde Collie",
  date_of_birth: "2016-02-16",
  weight: 25.0
)

pet5 = owner3.pets.create!(
  name: "Mia",
  species: "Cat",
  breed: "Persian",
  date_of_birth: "2021-11-30",
  weight: 3.9
)

# Status: 0 = scheduled, 1 = in progress, 2 = completed, 3 = cancelled

appointment1 = Appointment.create!(
  pet: pet1,
  vet: vet1,
  date: DateTime.now + 3,
  reason: "Annual checkup",
  status: 0
)

appointment2 = Appointment.create!(
  pet: pet2,
  vet: vet1,
  date: DateTime.now - 1,
  reason: "Vaccination",
  status: 2
)

appointment3 = Appointment.create!(
  pet: pet3,
  vet: vet2,
  date: DateTime.now,
  reason: "Dental cleaning",
  status: 1
)

appointment4 = Appointment.create!(
  pet: pet4,
  vet: vet2,
  date: DateTime.now - 7,
  reason: "Leg injury",
  status: 2
)

appointment5 = Appointment.create!(
  pet: pet5,
  vet: vet1,
  date: DateTime.now + 7,
  reason: "Skin irritation",
  status: 3
)

Treatment.create!(
  appointment: appointment2,
  name: "Vaccination",
  medication: "Rabies vaccine",
  dosage: "1ml",
  notes: "Perfect execution.",
  administered_at: DateTime.now - 1
)

Treatment.create!(
  appointment: appointment2,
  name: "Deworming",
  medication: "Fenbendazole",
  dosage: "0.5ml",
  notes: "Routine deworming administered.",
  administered_at: DateTime.now - 1
)

Treatment.create!(
  appointment: appointment3,
  name: "Dental Cleaning",
  medication: "Anesthesia",
  dosage: "2ml",
  notes: "Teeth in good condition.",
  administered_at: DateTime.now
)

Treatment.create!(
  appointment: appointment4,
  name: "Pain Relief",
  medication: "Meloxicam",
  dosage: "1.5ml",
  notes: "Administered for leg pain.",
  administered_at: DateTime.now - 7
)

Treatment.create!(
  appointment: appointment4,
  name: "Bandaging",
  medication: "None",
  dosage: "N/A",
  notes: "Leg bandaged. Keep dry for 5 days.",
  administered_at: DateTime.now - 7
)

puts "Seed data created successfully!"
puts "#{Owner.count} owners"
puts "#{Vet.count} vets"
puts "#{Pet.count} pets"
puts "#{Appointment.count} appointments"
puts "#{Treatment.count} treatments"