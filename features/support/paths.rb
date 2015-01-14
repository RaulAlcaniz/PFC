# features/support/paths.rb
module NavigationHelpers
# Maps a name to a path. Used by the
#
# When /^I go to (.+)$/ do |page_name|
#
# step definition
#
  def path_to(page_name)
    case page_name

      when /^the home\s?page$/
        '/'
      when /the group page for "([^\"]*)"/
        group_path(Group.find_by_name!($1))
      when /the section page for "([^\"]*)"/
        section = Section.find_by_name!($1)
        group_section_path(section.group, section)
      when /the subsection page for "([^\"]*)"/
        subsection = Subsection.find_by_name!($1)
        section_subsection_path(subsection.section, subsection)
      when /the breed page for "([^\"]*)"/
        breed = Breed.find_by_name!($1)
        send("#{breed.breedable_type.downcase}" + '_breed_path',breed.breedable_id, breed)
      when /the variety page for "([^\"]*)"/
        variety = Variety.find_by_name!($1)
        breed_variety_path(variety.breed, variety)
      when /the subvariety page for "([^\"]*)"/
        subvariety = Subvariety.find_by_name!($1)
        variety_subvariety_path(subvariety.variety, subvariety)
      when /the person page for "([^\"]*)"/
        #person_path((User.find_by_email!($1)))
        person_path(Person.find_by_name!($1))
      when /the profile for "([^\"]*)"/
        person_path((User.find_by_email!($1)))
      when /the dog page for "([^\"]*)"/
        dog = Dog.find_by_name!($1)
        #puts dog.person
        person_dog_path(dog.person, dog)
      when /the dogs page for "([^\"]*)"/
        person = Person.find_by_name!($1)
        person_dogs_path(person)
      when /the exhibition page for "([^\"]*)"/
        exhibition_path(Exhibition.find_by_name!($1))
      when /the enrolments page for "([^\"]*)"/
        exhibition = Exhibition.find_by_name!($1)
        exhibition_enrolments_path(exhibition)
      when /my profile page/
        person_path((User.find_by_email!(@user.email)))
      when /the payment page for "([^\"]*)"/
        dog = ($1).gsub(/and/,',').split(',').first.strip
        enrolment = Enrolment.find_by_dog_id(Dog.find_by_name((dog)).id)
        payment_path(enrolment.payment_id)
      when /my exhibitions page/
        people_my_exhibitions_path((User.find_by_email!(@user.email)))


# Add more mappings here.
# Here is an example that pulls values out of the Regexp:
#
# when /^(.*)'s profile page$/i
# user_profile_path(User.find_by_login($1))

      else
        begin
          page_name =~ /^the (.*) page$/
          path_components = $1.split(/\s+/)
          self.send(path_components.push('path').join('_').to_sym)
        rescue NoMethodError, ArgumentError
          raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
                    "Now, go and add a mapping in #{__FILE__}"
        end
    end
  end
end

World(NavigationHelpers)