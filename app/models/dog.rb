class Dog < ActiveRecord::Base
  belongs_to :dogable, polymorphic: true
  belongs_to :person
  has_many :enrolments
  has_many :exhibitions, :through => :enrolments

  validates :name, presence: true

  # Months between today and dog date of birth
  def how_many_months(date1, date2)
    (date2.year - date1.year) * 12 + date2.month - date1.month - (date2.day >= date1.day ? 0 : 1)
  end

  define_method('what_classes?'){ |date|
    # Months between today and the date of birth of the dog
    months = how_many_months((self.date_of_birth).to_datetime,DateTime.parse(date))

    classes=['Working', 'Couple']
    [
        ['Baby',3,5],
        ['Puppy',5,9],
        ['Junior',9,18],
        ['Intermediate',15,24],
        ['Open',15,96],
        ['Veteran',96,240]
    ].each do |type, min, max|
      classes << type if min < months and max > months
    end
      classes << 'Champion' if self.titles != ''
      classes
  }

end
