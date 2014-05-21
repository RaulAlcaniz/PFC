FactoryGirl.define do

  factory :group do |g|
    g.name 'no group name defined'
    g.description 'no group description defined'
  end

  factory :section do |s|
    s.group_id 0
    s.name 'no section name defined'
    s.description 'no section description defined'
  end

  factory :subsection do |sub|
    sub.section_id 0
    sub.name 'no section name defined'
    sub.description 'no section description defined'
  end

end