FactoryGirl.define do

  factory :group do |g|
    g.name {'Group ' + generate(:name)}
    g.description {'Group ' + generate(:description)}
  end

  factory :section do |s|
    s.group_id 0
    s.name {'Section ' + generate(:name)}
    s.description {'Section ' + generate(:description)}
  end

  factory :subsection do |sub|
    sub.section_id 0
    sub.name {'Subsection ' + generate(:name)}
    sub.description {'Subsection ' + generate(:description)}
  end

  factory :breed do |breed|
    breed.breedable_id 0
    breed.breedable_type 'None'
    breed.name {'Breed ' + generate(:name)}
  end

  factory :person do |person|
    person.name {'Person ' + generate(:name)}
    person.date_of_birth '1/01/2000'
    person.sex 'None'
    person.country 'None'
  end

  factory :dog do |dog|
    dog.name {'Dog ' + generate(:name)}
    dog.dogable { FactoryGirl.create(:breed) }
    dog.sire 'None'
    dog.dam 'None'
    dog.date_of_birth '1/01/2011'
    dog.sex 'None'
    dog.titles 'None'
  end

  factory :exhibition do |exhib|
    exhib.name {'Exhibition ' + generate(:name)}
    exhib.description {'Exhibition ' + generate(:description)}
    exhib.start_date DateTime.now + 1.hour
    exhib.end_date DateTime.now + 2.hour
  end

  factory :enrolment do |enrolment|

    enrolment.dog_id '1'
    enrolment.exhibition_id :exhibition_id
    enrolment.price :price
  end

  sequence :name do |n|
    "name no defined ##{n}"
  end
  sequence :description do |n|
    "description no defined ##{n}"
  end
end