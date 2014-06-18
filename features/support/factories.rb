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

  sequence :name do |n|
    "name no defined ##{n}"
  end
  sequence :description do |n|
    "description no defined ##{n}"
  end
end