
#
# Exhibition - 'Exposición canina de Cieza'
#
@tax = {:groups=>[{:name=>"group1", :classes=>["Junior", "Intermediate", "Open", "Working", "Champion"]}, {:name=>"group2", :classes=>["Veteran"]}, {:name=>"group3", :classes=>["Puppy"]}, {:name=>"group4", :classes=>["Couple"]}, {:name=>"group5", :classes=>["Group Breeding"]}], :deadlines=>[{:name=>"1st entry deadline", :start_date=>(Date.today).strftime('%d/%m/%Y'), :end_date=>(Date.today + 10.day).strftime('%d/%m/%Y')}, {:name=>"2nd entry deadline", :start_date=>(Date.today + 11.day).strftime('%d/%m/%Y'), :end_date=>(Date.today + 21.day).strftime('%d/%m/%Y')}, {:name=>"3rd entry deadline", :start_date=>(Date.today + 22.day).strftime('%d/%m/%Y'), :end_date=>(Date.today + 35.day).strftime('%d/%m/%Y')}], :prices=>[{:partners=>[{"group1"=>[["24.00", "19.00", "14.00"], ["30.00", "23.00", "18.00"], ["36.00", "27.00", "21.00"]]}, {"group2"=>[["12.00", "9.50", "7.00"], ["15.00", "11.50", "9.00"], ["18.00", "13.50", "10.50"]]}, {"group3"=>[["16.00", "12.00", "9.00"], ["20.00", "15.00", "12.00"], ["24.00", "18.00", "15.00"]]}, {"group4"=>[["20.00"], ["25.00"], ["29.00"]]}, {"group5"=>[["0.00"], ["0.00"], ["0.00"]]}]}, {:nopartners=>[{"group1"=>[["30.00", "25.00", "20.00"], ["37.50", "32.00", "25.00"], ["43.50", "37.00", "29.00"]]}, {"group2"=>[["15.00", "12.50", "10.00"], ["18.70", "16.00", "12.50"], ["21.75", "18.50", "14.50"]]}, {"group3"=>[["21.00", "15.00", "11.00"], ["27.00", "19.00", "14.00"], ["31.00", "21.00", "17.00"]]}, {"group4"=>[["25.00"], ["32.00"], ["37.00"]]}, {"group5"=>[["0.00"], ["0.00"], ["0.00"]]}]}]}.to_json

Exhibition.where(name: 'Exposicion Canina de Cieza',
                 description: 'Exposición de Campeonato para todas las Razas, que se regirá por el Reglamento de Exposiciones de la Real Sociedad Canina, poniendo en competición el C.A.C. Nacional, autorizado por la R.S.C.E.
La inspección veterinaria es obligatoria e indispensable para todos los ejemplares. La entrega del catálogos será por expositor y no por el numero de ejemplares inscritos. Los ejemplares residentes fuera de España y que estén inscritos en Libros de Origen Extranjeros reconocidos por la F.C.I. y la R.S.C.E., deberán de acompañar la fotocopia del pedigrí y enviarla junto con la inscripción.
No puede admitirse en Clase Abierta ningún ejemplar con Libro de Origen Extranjero cuando el propietario sea español o extranjero residente en España. Se pueden admitir ejemplares con Libro de Origen Extranjero en Clase Jóvenes.
Igualmente se pueden admitir ejemplares en Clase Cachorros con Libro de Orígenes en tramite o Extranjero. Todo ejemplar que haya obtenido una de las calificaciones Mejor de Raza en cada Clase, y no esté presente en la final de grupos correspondiente, SERA DESCALIFICADO. Igualmente, todo ejemplar que haya obtenido la calificación necesaria para las Grandes Finales y no esté presente en las mismas, SERA TAMBIÉN DESCALIFICADO.

No se confirmará, quien de antemano no haya sido inscrito en su clase correspondiente.',
                 start_date: '2015-08-29 14:00:00', end_date: '2015-08-30 20:00:00', tax: @tax, image: File.open(File.join(Rails.root, "/public/cieza.jpg"))).create!

#
# Exhibition - 'Exposición canina de Jerez de la Frontera'
#
@tax = {:groups=>[{:name=>"group1", :classes=>["Junior", "Intermediate", "Open", "Working", "Champion"]}, {:name=>"group2", :classes=>["Couple"]}, {:name=>"group3", :classes=>["Group Breeding"]}, {:name=>"group4", :classes=>["Veteran"]}, {:name=>"group5", :classes=>["Puppy"]}], :deadlines=>[{:name=>"1st entry deadline", :start_date=>(Date.today - 10.day).strftime('%d/%m/%Y'), :end_date=>(Date.today - 4.day).strftime('%d/%m/%Y')}, {:name=>"2nd entry deadline", :start_date=>(Date.today - 3.day).strftime('%d/%m/%Y'), :end_date=>(Date.today).strftime('%d/%m/%Y')}, {:name=>"3rd entry deadline", :start_date=>(Date.today + 1.day).strftime('%d/%m/%Y'), :end_date=>(Date.today + 11.day).strftime('%d/%m/%Y')}], :prices=>[{:partners=>[{"group1"=>[["19.00", "14.00", "9.50"], ["23.50", "17.50", "11.50"], ["28.00", "21.00", "15.00"]]}, {"group2"=>[["15.00"], ["19.00"], ["22.00"]]}, {"group3"=>[["0.00"], ["0.00"], ["0.00"]]}, {"group4"=>[["10.00", "7.00", "5.00"], ["12.50", "9.00", "6.50"], ["14.00", "11.00", "7.50"]]}, {"group5"=>[["10.00", "7.00", "5.00"], ["12.50", "9.00", "6.50"], ["15.00", "11.50", "8.00"]]}]}, {:nopartners=>[{"group1"=>[["24.00", "19.00", "13.50"], ["29.50", "23.00", "17.00"], ["34.00", "27.00", "20.00"]]}, {"group2"=>[["18.00"], ["23.00"], ["28.00"]]}, {"group3"=>[["0.00"], ["0.00"], ["0.00"]]}, {"group4"=>[["12.00", "9.50", "7.50"], ["15.50", "11.50", "9.00"], ["17.00", "14.00", "10.50"]]}, {"group5"=>[["12.50", "9.00", "7.00"], ["15.50", "11.50", "9.00"], ["18.00", "15.50", "12.00"]]}]}]}.to_json

Exhibition.where(name: 'Exposición canina de Jerez de la Frontera',
                  description: 'XXXIV Exposición nacional y XVII Exposición internacional canina, Provincia de Cádiz, Jerez de la Frontera. A partir de las 08:00 H. Apertura del recinto y control veterinario itinerante.
Juicios a partir de las 09:00 H. con arreglo a los horarios que se establezcan para cada raza. Todos los perros participantes deberán estar dispuestos a la entrada del ring media hora antes de ser juzgados.
Las finales del grupo y Gran Final se iniciarán a partir de las 15:30 h. de cada día. Los ejemplares que obtengan Mejor Raza en Clase Muy Cachorros, Cachorros, Jóvenes, Veteranos, Intermedia, Trabajo, Abierta y Campeons, así como los ganadores de grupo y Razas Españolas, deberán estar presentes en sus finales respectivas. De no hacerlo, serán descalificados. ',
                  start_date: '2015-11-01 08:00:00', end_date: '2015-11-02 20:00:00', tax: @tax, image: File.open(File.join(Rails.root, "/public/jerez.jpg"))).create!

#
# Exhibition - 'Amsterdam Holland Cup'
#
@tax = {:groups=>[{:name=>"group1", :classes=>["Puppy"]}, {:name=>"group2", :classes=>["Junior", "Intermediate", "Open", "Working", "Champion", "Veteran"]}, {:name=>"group3", :classes=>["Group Breeding"]}], :deadlines=>[{:name=>"1st entry deadline", :start_date=>(Date.today - 10.day).strftime('%d/%m/%Y'), :end_date=>(Date.today + 4.day).strftime('%d/%m/%Y')}, {:name=>"2nd entry deadline", :start_date=>(Date.today + 5.day).strftime('%d/%m/%Y'), :end_date=>(Date.today + 15.day).strftime('%d/%m/%Y')}], :prices=>[{:nopartners=>[{"group1"=>[["30.00"], ["30.00"]]}, {"group2"=>[["55.00"], ["65.00"]]}, {"group3"=>[["5.00"], ["5.00"]]}]}]}.to_json

Exhibition.where(name: '125ste Amsterdam Winner Show',
                 description: 'Wij hebben we gekozen voor een laag inschrijfgeld. Het aantal deelnemers is beperkt en VOL=VOL. Het inschrijfgeld moet uiterlijk 25 november 2014 op onze rekening zijn bijgeschreven. Na 25 november wordt het inschrijfgeld met € 10.00 per hond verhoogd voor administratiekosten. Betaling op show is, tenzij uitdrukkelijk overeengekomen, niet mogelijk. U betaalt dan een toeslag van € 15.00 per hond. Betalingen bijgeschreven op onze rekening op of na 8 december worden beschouwd als niet ontvangen . U dient op show dan nogmaals het verschuldigde bedrag te voldoen (incl. administratiekosten). Mocht dan blijken dat uw betaling op of na 8 december is bijgeschreven op onze rekening, dan wordt het op de bankrekening ontvangen bedrag, na de show aan u terugbetaald.',
                 start_date: '2015-12-12 08:00:00', end_date: '2015-12-14 20:00:00', tax: @tax, image: File.open(File.join(Rails.root, "/public/Amsterdam.jpg"))).create!

#
# Exhibition - 'Exposición canina Medina de Pomar'
#

@tax = {:groups=>[{:name=>"group1", :classes=>["Junior", "Open", "Champion"]}, {:name=>"group2", :classes=>["Couple"]}, {:name=>"group3", :classes=>["Group Breeding"]}, {:name=>"group4", :classes=>["Puppy"]}], :deadlines=>[{:name=>"1st entry deadline", :start_date=>(Date.today + 62.day).strftime('%d/%m/%Y'), :end_date=>(Date.today + 70.day).strftime('%d/%m/%Y')}, {:name=>"2nd entry deadline", :start_date=>(Date.today + 71.day).strftime('%d/%m/%Y'), :end_date=>(Date.today + 90.day).strftime('%d/%m/%Y')}], :prices=>[{:partners=>[{"group1"=>[["25.00", "18.00", "14.00"], ["30.00", "21.00", "17.00"]]}, {"group2"=>[["20.00"], ["23.00"]]}, {"group3"=>[["0.00"], ["0.00"]]}, {"group4"=>[["16.00", "13.00", "10.00"], ["19.00", "15.00", "12.00"]]}]}, {:nopartners=>[{"group1"=>[["30.00", "24.00", "20.00"], ["37.00", "29.00", "23.00"]]}, {"group2"=>[["25.00"], ["28.00"]]}, {"group3"=>[["0.00"], ["0.00"]]}, {"group4"=>[["19.00", "15.00", "13.00"], ["22.00", "17.00", "14.00"]]}]}]}.to_json

Exhibition.where(name: 'Exposición canina de Medina de Pomar',
                 description: 'Los ejemplares inscritos en Libros de Orígenes extranjeros reconocidos por la F.C.I. y la R.S.C.E., deberán acompañar a la hoja de inscripción la fotocopia de Pedigree Original.
Sólo se admitirán inscripciones que vengan acompañadas de las fotocopias del resguardo que justifique el pago de las mismas, tanto por correo como por fax. Se tomará como fecha de inscripción la que figure en el abono.


Les chiens inscrits dans les livres d’origine étranjers reconnus par la F.C.I. et la Societé Centrale Espagnole, devront accompagner la feuille déngagement de la photocopie de Pedigree Original.
Toute inscripction devra étre accompagnée de la photocopie du recipisée qui justifie le reglement des engagement, aussi bien par lettre que per fax. La date qui sera pris comme la date de l’inscription, sera cèlle qui apparalt dans l’acompte.',
                 start_date: '2015-12-12 08:00:00', end_date: '2015-12-14 20:00:00', tax: @tax, image: File.open(File.join(Rails.root, "/public/medina.jpg"))).create!

#
# Exhibition - 'VALLS - Tarragona'
#

@tax = {:groups=>[{:name=>"group1", :classes=>["Puppy"]}, {:name=>"group2", :classes=>["Junior", "Intermediate", "Open", "Working", "Champion", "Veteran"]}, {:name=>"group3", :classes=>["Group Breeding"]}], :deadlines=>[{:name=>"1st entry deadline", :start_date=>(Date.today - 120.day).strftime('%d/%m/%Y'), :end_date=>(Date.today - 100.day).strftime('%d/%m/%Y')}, {:name=>"2nd entry deadline", :start_date=>(Date.today - 90.day).strftime('%d/%m/%Y'), :end_date=>(Date.today - 80.day).strftime('%d/%m/%Y')}], :prices=>[{:nopartners=>[{"group1"=>[["30.00"], ["30.00"]]}, {"group2"=>[["55.00"], ["65.00"]]}, {"group3"=>[["5.00"], ["5.00"]]}]}]}.to_json

Exhibition.where(name: 'III INTERNATIONAL DOG SHOW NATIONAL EXHIBITION AND CANINE XIV',
                 description: 'VETERANS CLASS (CV) For dogs who have completed 8 years, no upper age limit, who
are enrolled in the LOE / RRC or other stud book recognized by the FCI, after accreditation with the copy of pedigree.
VETERANS and BREED SPANISH (except puppies) 50% PREVIOUS RATE (in separate account).
Dogs in ownership are billed separately from those of a single owner. To apply the Membership Fee, all owners must be
exemplary partners.

CATALOGUE shipping and DORSALES be digital, via email, if you want PRINTED CATALOGUE, will increase the price of their registration at 5.00 €, expressly stating that you want a printed catalog, checking the box corresponding.',
                 start_date: '2015-5-18 08:00:00', end_date: '2015-5-18 20:00:00', tax: @tax).create!


#
# Exhibition - 'GRAZ'
#

@tax = {:groups=>[{:name=>"group1", :classes=>["Puppy"]}, {:name=>"group2", :classes=>["Junior", "Intermediate", "Open", "Working", "Champion", "Veteran"]}, {:name=>"group3", :classes=>["Group Breeding"]}], :deadlines=>[{:name=>"1st entry deadline", :start_date=>(Date.today - 120.day).strftime('%d/%m/%Y'), :end_date=>(Date.today - 100.day).strftime('%d/%m/%Y')}, {:name=>"2nd entry deadline", :start_date=>(Date.today - 90.day).strftime('%d/%m/%Y'), :end_date=>(Date.today - 80.day).strftime('%d/%m/%Y')}], :prices=>[{:nopartners=>[{"group1"=>[["30.00"], ["30.00"]]}, {"group2"=>[["55.00"], ["65.00"]]}, {"group3"=>[["5.00"], ["5.00"]]}]}]}.to_json

Exhibition.where(name: 'INTERNATIONAL DOG SHOW GRAZ',
                 description: 'Group assignment:
Saturday: FCI Groups: III, IV, V, VI, VII, VIII und X
Sunday: FCI Groups: I, II und IX

Daily schedule:
from 07:30 o\'clock - intaking dogs
from 10:00 o\'clock to 14:00 o\'clock - judging in the rings
from 14:00 o\'clock - program in the ring of honour',
                 start_date: '2015-5-18 08:00:00', end_date: '2015-5-18 20:00:00', tax: @tax, image: File.open(File.join(Rails.root, "/public/graz.jpg"))).create!


#
# Users
#
admin = User.where(email: 'admin@example.com').first_or_create! do |user|
  user.password = 'adminpassword'
  user.admin = true
end
admin.confirm!

user1 = User.where(email: 'usuario1@example.com').first_or_create! do |user|
  user.password = 'password'
  user.admin = false
end
user1.confirm!

user2 = User.where(email: 'usuario2@example.com').first_or_create! do |user|
  user.password = 'password'
  user.admin = false
end
user2.confirm!

user3 = User.where(email: 'usuario3@example.com').first_or_create! do |user|
  user.password = 'password'
  user.admin = false
end
user3.confirm!

#
# Dogs
#
Dog.where(name:'Viejito').first_or_create! do |dog|
  dog.sex = 'Male'
  dog.date_of_birth = '2002-01-17'
  dog.sire = 'Rex'
  dog.dam = 'Missy'
  dog.dogable_id = '39'
  dog.dogable_type = 'Breed'
  dog.person_id = Person.find_by_name('usuario1@example.com').id
end

Dog.where(name:'Campeona').first_or_create! do |dog|
  dog.sex = 'Female'
  dog.titles = 'PORTO WINNER Jr.'
  dog.date_of_birth = '2013-12-18'
  dog.sire = 'Tono'
  dog.dam = 'Lili'
  dog.dogable_id = '9'
  dog.dogable_type = 'Subvariety'
  dog.person_id = Person.find_by_name('usuario1@example.com').id
end

Dog.where(name:'Scooby Doo').first_or_create! do |dog|
  dog.sex = 'Male'
  dog.date_of_birth = '2009-10-23'
  dog.sire = 'Skip'
  dog.dam = 'Laika'
  dog.dogable_id = '95'
  dog.dogable_type = 'Variety'
  dog.person_id = Person.find_by_name('usuario1@example.com').id
end

Dog.where(name:'Baby').first_or_create! do |dog|
  dog.sex = 'Female'
  dog.date_of_birth = '2014-06-17'
  dog.sire = 'Snoopy'
  dog.dam = 'Iris'
  dog.dogable_id = '119'
  dog.dogable_type = 'Variety'
  dog.person_id = Person.find_by_name('usuario1@example.com').id
end

Dog.where(name:'Lassie').first_or_create! do |dog|
  dog.sex = 'Female'
  dog.date_of_birth = '2008-02-02'
  dog.sire = 'Rolf'
  dog.dam = 'Linda'
  dog.dogable_id = '229'
  dog.dogable_type = 'Breed'
  dog.person_id = Person.find_by_name('usuario2@example.com').id
end

#
# Groups
#
[
    ['Group I', 'Sheepdogs and Cattledogs (except Swiss Cattledogs)'],
    ['Group II', 'Pinscher and Schnauzer - Molossoid and Swiss Mountain and Cattledogs'],
    ['Group III', 'Terriers'],
    ['Group IV', 'Dachshunds'],
    ['Group V', 'Spitz and primitive types'],
    ['Group VI', 'Scenthounds and related breeds'],
    ['Group VII', 'Pointing Dogs'],
    ['Group VIII', 'Retrievers - Flushing Dogs - Water Dogs'],
    ['Group IX', 'Companion and Toy Dogs'],
    ['Group X', 'Sighthounds']
].each do |name, description|
  Group.where(name: name, description: description).first_or_create!
end

###############################################
################## Group I ####################
###############################################

#
# Group I - Sections
#
[
  ['Section 1', 'Sheepdogs'],
  ['Section 2', 'Cattle Dogs (except Swiss Cattle dogs)']
].each do |name, description|
  Group.find_by(:description => 'Sheepdogs and Cattledogs (except Swiss Cattledogs)').
      sections.where(name: name, description: description).first_or_create!
end

#
# Group I - Section 1 - Breeds
#
[
  'Australian Kelpie (293)',
  'Chien de Berger Belge (15) (Belgian Shepherd Dog)',
  'Schipperke (83)',
  'Ceskoslovenský Vlciak (332) (Czechoslovakian Wolfdog)',
  'Hrvatski Ovcar (277) (Croatian Shepherd Dog)',
  'Deutscher Schäferhund (166) (German Shepherd Dog)',
  'Ca de Bestiar - Perro de pastor mallorquín (321) (Majorca Shepherd Dog)',
  'Gos d\'Atura Catalá - Perro de pastor catalán (87) (Catalonian Sheepdog)',
  'Berger de Beauce (Beauceron) (44)',
  'Berger de Brie (Briard) (113)',
  'Berger de Picardie (Berger Picard) (176) (Picardy Sheepdog)',
  'Chien de Berger des Pyrénées à poil long (141) (Pyrenean Sheepdog Long-haired)',
  'Chien de Berger des Pyrénées à face rase (138) (Pyrenean Sheepdog - smooth faced)',
  'Bearded Collie (271)',
  'Border Collie (297)',
  'Collie Rough (156)',
  'Collie Smooth (296)',
  'Old English Sheepdog (Bobtail) (16)',
  'Shetland Sheepdog (88)',
  'Welsh Corgi Cardigan (38)',
  'Welsh Corgi Pembroke (39)',
  'Cane da pastore Bergamasco (194) (Bergamasco Shepherd)',
  'Cane da pastore Maremmano-Abruzzese (201) (Maremma and the Abruzzes Sheepdog)',
  'Komondor (53)',
  'Kuvasz (54)',
  'Mudi (238)',
  'Puli (55)',
  'Pumi (56)',
  'Hollandse Herdershond (223) (Dutch Shepherd Dog)',
  'Saarlooswolfhond (311) (Saarloos Wolfdog)',
  'Nederlandse Schapendoes (313) (Dutch Schapendoes)',
  'Polski Owczarek Nizinny (251) (Polish Lowland Sheepdog)',
  'Polski Owczarek Podhalanski (252) (Tatra Shepherd Dog)',
  'Cão da Serra de Aires (93) (Portuguese Sheepdog)',
  'Slovenský Cuvac (142) (Slovakian Chuvach)',
  'Ioujnorousskaïa Ovtcharka (326) (South Russian Shepherd Dog)',
  'Berger Blanc Suisse (347) (White Swiss Shepherd Dog)',
  'Australian Shepherd (342)'
].each do |name|
  Section.find_by(:description => 'Sheepdogs').breeds.where(name: name).first_or_create!
end

#
# Group I - Section 1 - Varieties
#
%w(Groenendael
  Laekenois
  Malinois
  Tervueren
).each do |name|
  Breed.where('name LIKE ?', '%Chien de Berger Belge%').first.varieties.where(name: name).first_or_create!
end


[
  'Double coat',
  'Long and harsh outer coat'
].each do |name|
  Breed.where('name LIKE ?', '%Deutscher Schäferhund%').first.varieties.where(name: name).first_or_create!
end

%w(Short-haired
  Long-haired
).each do |name|
  Breed.where('name LIKE ?', '%Ca de Bestiar%').first.varieties.where(name: name).first_or_create!
end

[
  'Black and tan',
  'Harlequin'
].each do |name|
  Breed.where('name LIKE ?', '%Berger de Beauce%').first.varieties.where(name: name).first_or_create!
end

[
  'Slate',
  'Fawn, grey'
].each do |name|
  Breed.where('name LIKE ?', '%Berger de Brie%').first.varieties.where(name: name).first_or_create!
end

['Fawn',
 'Black',
 'Blue-merle',
 'Ash Coloured (Blue Grey)',
 'Brown',
 'White'
].each do |name|
  Breed.where('name LIKE ?', '%Mudi%').first.varieties.where(name: name).first_or_create!
end

[
  'Pearl-white',
  'Black',
  'Black shaded with rust-red or grey',
  'Fawn',
  'Grey in any shade'
].each do |name|
  Breed.where('name LIKE ?', '%Puli%').first.varieties.where(name: name).first_or_create!
end

[
  'Grey in various shades',
  'Black',
  'Fawn (Fakó). Primary colours: Red, Yellow, Cream',
  'White'
].each do |name|
  Breed.where('name LIKE ?', '%Pumi%').first.varieties.where(name: name).first_or_create!
end

%w(Short-haired
 Long-haired
 Rough-haired
).each do |name|
  Breed.where('name LIKE ?', '%Hollandse Herdershond%').first.varieties.where(name: name).first_or_create!
end

#
# Group I - Section 2 - Breeds
#
[
  'Australian Cattle Dog (287)',
  'Bouvier des Ardennes (171)',
  'Bouvier des Flandres/Vlaamse Koehond (191)',
].each do |name|
  Section.find_by(:description => 'Cattle Dogs (except Swiss Cattle dogs)').breeds.where(name: name).first_or_create!
end


###############################################
################# Group II ####################
###############################################

#
# Group II - Sections
#
[
  ['Section 1', 'Pinscher and Schnauzer type'],
  ['Section 2', 'Molossoid breeds'],
  ['Section 3', 'Swiss Mountain and Cattle Dogs']
].each do |name, description|
  Group.find_by(:description => 'Pinscher and Schnauzer - Molossoid and Swiss Mountain and Cattledogs')
  .sections.where(name: name, description: description).first_or_create!
end

#
# Group II - Subsections
#
[
  ['Subsection 1.1', 'Pinscher'],
  ['Subsection 1.2', 'Schnauzer'],
  ['Subsection 1.3', 'Smoushond'],
  ['Subsection 1.4', 'Russkiy Tchiorny Terrier']
].each do |name, description|
  Section.find_by(:description => 'Pinscher and Schnauzer type').subsections.where(name: name, description: description).first_or_create!
end

[
  ['Subsection 2.1', 'Mastiff type'],
  ['Subsection 2.2', 'Mountain type'],
].each do |name, description|
  Section.find_by(:description => 'Molossoid breeds').subsections.where(name: name, description: description).first_or_create!
end

#
# Group II - Subsection 1.1 - Breeds
#
[
  'Dobermann (143)',
  'Deutscher Pinscher (German Pinscher) (184)',
  'Zwergpinscher (185) (Miniature Pinscher)',
  'Affenpinscher (186)',
  'Österreichischer Pinscher (64) (Austrian Pinscher)'
].each do |name|
  Subsection.find_by(:description => 'Pinscher').breeds.where(name: name).first_or_create!
end

#
# Group II - Subsection 1.1 - Varieties
#
[
  'Black with rust red clearly defined and clean markings',
  'Brown with rust red clearly defined and clean markings'
].each do |name|
  Breed.where('name LIKE ?', '%Dobermann%').first.varieties.where(name: name).first_or_create!
end

[
  'Self coloured: Deer red, reddish-brown to dark red brown',
  'Black and tan'
].each do |name|
  Breed.where('name LIKE ?', '%Deutscher Pinscher%').first.varieties.where(name: name).first_or_create!
  Breed.where('name LIKE ?', '%Zwergpinscher%').first.varieties.where(name: name).first_or_create!
end

#
# Group II - Subsection 1.2 - Breeds
#
[
  'Riesenschnauzer (181) (Giant Schnauzer)',
  'Schnauzer (182)',
  'Zwergschnauzer (183) (Miniature Schnauzer)',
].each do |name|
  Subsection.find_by(:description => 'Schnauzer').breeds.where(name: name).first_or_create!
end

#
# Group II - Subsection 1.2 - Varieties
#
[
  'Pure black with black undercoat',
  'Pepper and salt'
].each do |name|
  Breed.where('name LIKE ?', '%Riesenschnauzer%').first.varieties.where(name: name).first_or_create!
  Breed.where('name LIKE ?', '%Schnauzer%').first.varieties.where(name: name).first_or_create!
end

[
  'Pepper and salt',
  'Pure black with black undercoat',
  'Black and silver',
  'Pure white with white undercoat'
].each do |name|
  Breed.where('name LIKE ?', '%Zwergschnauzer%').first.varieties.where(name: name).first_or_create!
end

#
# Group II - Subsection 1.3 - Breeds
#
[
  'Hollandse Smoushond (308) (Dutch Smoushond)',
].each do |name|
  Subsection.find_by(:description => 'Smoushond').breeds.where(name: name).first_or_create!
end

#
# Group II - Subsection 1.4 - Breeds
#
[
  'Russkiy Tchiorny Terrier (327) (Russian Black Terrier)',
].each do |name|
  Subsection.find_by(:description => 'Russkiy Tchiorny Terrier').breeds.where(name: name).first_or_create!
end

#
# Group II - Section 2 - Breeds
#
[
    'Cane Corso Italiano (343) (Italian Corso Dog)'
].each do |name|
  Section.find_by(:description => 'Molossoid breeds').breeds.where(name: name).first_or_create!
end

#
# Group II - Subsection 2.1 - Breeds
#
[
  'Dogo Argentino (292)',
  'Fila Brasileiro (225)',
  'Shar Pei (309)',
  'Broholmer (315)',
  'Deutscher Boxer (144) (Boxer)',
  'Deutsche Dogge (235) (Great Dane)',
  'Rottweiler (147)',
  'Perro dogo mallorquín (Ca de Bou) (249) (Majorca Mastiff)',
  'Dogo Canario (346)',
  'Dogue de Bordeaux (116)',
  'Bulldog (149)',
  'Bullmastiff (157)',
  'Mastiff (264)',
  'Mastino Napoletano (197) (Neapolitan Mastiff)',
  'Tosa (260)',
  'Cão Fila de São Miguel (340) (Saint Miguel Cattle Dog)'
].each do |name|
  Subsection.find_by(:description => 'Mastiff type').breeds.where(name: name).first_or_create!
end

#
# Group II - Subsection 2.1 - Varieties
#
%w(Fawn
  Brindle
).each do |name|
  Breed.where('name LIKE ?', '%Deutscher Boxer%').first.varieties.where(name: name).first_or_create!
end

%w(Fawn
  Brindle
  Black
  Harlequin
  Blue
).each do |name|
  Breed.where('name LIKE ?', '%Deutsche Dogge%').first.varieties.where(name: name).first_or_create!
end

#
# Group II - Subsection 2.2 - Breeds
#
[
  'Coban Köpegi (331) (Anatolian Shepherd Dog)',
  'Newfoundland (50)',
  'Hovawart (190)',
  'Leonberger (145)',
  'Landseer (europäisch-kontinentaler Typ) (226) (European Continental type)',
  'Mastín español (91) (Spanish Mastiff)',
  'Mastín del Pirineo (92) (Pyrenean Mastiff)',
  'Chien de Montagne des Pyrénées (137) (Pyrenean Mountain Dog)',
  'Jugoslovenski Ovcarski Pas - Sarplaninac (41) (Yugoslavian Shepherd Dog-Sharplanina)',
  'Chien de Montagne de l\'Atlas (Aïdi) (247) (Atlas Mountain Dog - Aidi)',
  'Cão da Serra da Estrela (173) (Estrela Mountain Dog)',
  'Cão de Castro Laboreiro (170) (Castro Laboreiro Dog)',
  'Rafeiro do Alentejo (96) (Rafeiro of Alentejo)',
  'St.Bernhardshund (Bernhardiner) (61) (St. Bernard)',
  'Kraski Ovcar (278) (Karst Shepherd Dog)',
  'Kavkazskaïa Ovtcharka (328) (Caucasian Shepherd Dog)',
  'Sredneasiatskaïa Ovtcharka (335) (Central Asia Shepherd Dog)',
  'Do-Khyi (230) (Tibetan Mastiff)'
].each do |name|
  Subsection.find_by(:description => 'Mountain type').breeds.where(name: name).first_or_create!
end

#
# Group II - Subsection 2.2 - Varieties
#
[
  'Black',
  'Brown',
  'White and black'
].each do |name|
  Breed.where('name LIKE ?', '%Newfoundland%').first.varieties.where(name: name).first_or_create!
end

%w(Black-Gold
  Black
  Blond
).each do |name|
  Breed.where('name LIKE ?', '%Hovawart%').first.varieties.where(name: name).first_or_create!
end

%w(Short-haired
  Long-haired
).each do |name|
  Breed.where('name LIKE ?', '%Cão da Serra da Estrela%').first.varieties.where(name: name).first_or_create!
  Breed.where('name LIKE ?', '%St.Bernhardshund%').first.varieties.where(name: name).first_or_create!
end

#
# Group II - Section 3 - Breeds
#
[
  'Appenzeller Sennenhund (46) (Appenzell Cattle Dog)',
  'Berner Sennenhund (45) (Bernese Mountain Dog)',
  'Entlebucher Sennenhund (47) (Entlebuch Cattle Dog)',
  'Grosser Schweizer Sennenhund (58) (Great Swiss Mountain Dog)'
].each do |name|
  Section.find_by(:description => 'Swiss Mountain and Cattle Dogs').breeds.where(name: name).first_or_create!
end


###############################################
################# Group III ###################
###############################################

#
# Group III - Sections
#
[
  ['Section 1', 'Large and medium-sized Terriers'],
  ['Section 2', 'Small-sized Terriers'],
  ['Section 3', 'Bull type Terriers'],
  ['Section 4', 'Toy Terriers']
].each do |name, description|
  Group.find_by(:description => 'Terriers').sections.where(name: name, description: description).first_or_create!
end

#
# Group III - Section 1 - Breeds
#
[
  'Terrier Brasileiro (341) (Brazilian Terrier)',
  'Deutscher Jagdterrier (103) (German Hunting Terrier)',
  'Airedale Terrier (7)',
  'Bedlington Terrier (9)',
  'Border Terrier (10)',
  'Fox Terrier (Smooth) (12)',
  'Fox Terrier (Wire) (169)',
  'Lakeland Terrier (70)',
  'Manchester Terrier (71)',
  'Parson Russell Terrier (339)',
  'Welsh Terrier (78)',
  'Irish Glen of Imaal Terrier (302)',
  'Irish Terrier (139)',
  'Kerry Blue Terrier (3)',
  'Irish Soft Coated Wheaten Terrier (40)'
].each do |name|
  Section.find_by(:description => 'Large and medium-sized Terriers').breeds.where(name: name).first_or_create!
end

#
# Group III - Section 2 - Breeds
#
[
  'Australian Terrier (8)',
  'Jack Russell Terrier (345)',
  'Cairn Terrier (4)',
  'Dandie Dinmont Terrier (168)',
  'Norfolk Terrier (272)',
  'Norwich Terrier (72)',
  'Scottish Terrier (73)',
  'Sealyham Terrier (74)',
  'Skye Terrier (75)',
  'West Highland White Terrier (85)',
  'Nihon Teria (259) (Japanese Terrier)',
  'Ceský Teriér (246) (Cesky Terrier)'
].each do |name|
  Section.find_by(:description => 'Small-sized Terriers').breeds.where(name: name).first_or_create!
end

#
# Group III - Section 3 - Breeds
#
[
  'Bull Terrier (11)',
  'Miniature Bull Terrier (359)',
  'Staffordshire Bull Terrier (76)',
  'American Staffordshire Terrier (286)'
].each do |name|
  Section.find_by(:description => 'Bull type Terriers').breeds.where(name: name).first_or_create!
end

#
# Group III - Section 4 - Breeds
#
[
  'Australian Silky Terrier (236)',
  'English Toy Terrier (Black and Tan) (13)',
  'Yorkshire Terrier (86)'
].each do |name|
  Section.find_by(:description => 'Toy Terriers').breeds.where(name: name).first_or_create!
end

###############################################
################## Group IV ###################
###############################################

#
# Group IV - Sections
#
[
  ['Section 1', 'Dachshunds']
].each do |name, description|
  Group.find_by(:description => 'Dachshunds').sections.where(name: name, description: description).first_or_create!
end

#
# Group IV - Section 1 - Breeds
#
[
  'Dachshund (148)'
].each do |name|
  Section.find_by(:description => 'Dachshunds').breeds.where(name: name).first_or_create!
end

#
# Group IV - Section 1 - Varieties
#
[
  'Standard',
  'Miniature',
  'Rabbit Dachshund'
].each do |name|
  Breed.where('name LIKE ?', '%Dachshund%').first.varieties.where(name: name).first_or_create!
end

#
# Group IV - Section 1 - Subvarieties
#
%w(
  Smooth-haired
  Long-haired
  Wire-haired
).each do |name|
  Breed.where('name LIKE ?', '%Dachshund%').first.
      varieties.where('name LIKE ?', '%Standard%').first.subvarieties.where(name: name).first_or_create!
  Breed.where('name LIKE ?', '%Dachshund%').first.
      varieties.where('name LIKE ?', '%Miniature%').first.subvarieties.where(name: name).first_or_create!
  Breed.where('name LIKE ?', '%Dachshund%').first.
      varieties.where('name LIKE ?', '%Rabbit Dachshund%').first.subvarieties.where(name: name).first_or_create!
end

###############################################
################### Group V ###################
###############################################

#
# Group V - Sections
#
[
  ['Section 1', 'Nordic Sledge Dogs'],
  ['Section 2', 'Nordic Hunting Dogs'],
  ['Section 3', 'Nordic Watchdogs and Herders'],
  ['Section 4', 'European Spitz'],
  ['Section 5', 'Asian Spitz and related breeds'],
  ['Section 6', 'Primitive type'],
  ['Section 7', 'Primitive type - Hunting Dogs'],
  ['Section 8', 'Primitive type Hunting Dogs with a ridge on the back']
].each do |name, description|
  Group.find_by(:description => 'Spitz and primitive types').sections.where(name: name, description: description).first_or_create!
end

#
# Group V - Section 1 - Breeds
#
[
  'Grønlandshund (274) (Greenland Dog)',
  'Samoiedskaïa Sabaka (212) (Samoyed)',
  'Alaskan Malamute (243)',
  'Siberian Husky (270)'
].each do |name|
  Section.find_by(:description => 'Nordic Sledge Dogs').breeds.where(name: name).first_or_create!
end

#
# Group V - Section 2 - Breeds
#
[
  'Norsk Elghund Grå (242) (Norwegian Elkhound grey)',
  'Norsk Elghund Sort (268) (Norwegian Elkhound black)',
  'Norsk Lundehund (265) (Norwegian Lundehund)',
  'Russko-Evropeïskaïa Laïka (304) (Russian-European Laika)',
  'Vostotchno-Sibirskaïa Laïka (305) (East-Siberian Laika)',
  'Zapadno-Sibirskaïa Laïka (306) (West-Siberian Laïka)',
  'Jämthund (42)',
  'Norrbottenspets (276) (Norrbottenspitz)',
  'Karjalankarhukoira (48) (Karelian Bear Dog)',
  'Suomenpystykorva (49) (Finnish Spitz)'
].each do |name|
  Section.find_by(:description => 'Nordic Hunting Dogs').breeds.where(name: name).first_or_create!
end

#
# Group V - Section 3 - Breeds
#
[
  'Islenskur Fjárhundur (289) (Icelandic Sheepdog)',
  'Norsk Buhund (237) (Norwegian Buhund)',
  'Svensk Lapphund (135) (Swedish Lapphund)',
  'Västgötaspets (14) (Swedish Vallhund)',
  'Suomenlapinkoira (189) (Finnish Lapphund)',
  'Lapinporokoira (284) (Lapponian Herder)'
].each do |name|
  Section.find_by(:description => 'Nordic Watchdogs and Herders').breeds.where(name: name).first_or_create!
end

#
# Group V - Section 4 - Breeds
#
[
  'Deutscher Spitz (97) (German Spitz)',
  'Volpino Italiano (195) (Italian Volpino)'
].each do |name|
  Section.find_by(:description => 'European Spitz').breeds.where(name: name).first_or_create!
end

#
# Group V - Section 4 - Varieties
#
[
  'Keeshond',
  'Wolfspitz',
  'Giant spitz',
  'Medium size Spitz',
  'Miniature Spitz',
  'Pomeranian'
].each do |name|
  Breed.where('name LIKE ?', '%Deutscher Spitz%').first.varieties.where(name: name).first_or_create!
end

#
# Group V - Section 4 - Subvarieties
#
%w(White
  Brown
  Black
).each do |name|
  Breed.where('name LIKE ?', '%Deutscher Spitz%').first.
      varieties.where('name LIKE ?', '%Giant spitz%').first.subvarieties.where(name: name).first_or_create!
end

%w(White
  Orange
  Grey
  Autre
  Brown
  Black
).each do |name|
  Breed.where('name LIKE ?', '%Deutscher Spitz%').first.
      varieties.where('name LIKE ?', '%Medium size Spitz%').first.subvarieties.where(name: name).first_or_create!
  Breed.where('name LIKE ?', '%Deutscher Spitz%').first.
      varieties.where('name LIKE ?', '%Miniature Spitz%').first.subvarieties.where(name: name).first_or_create!
end

#
# Group V - Section 5 - Breeds
#
[
  'Chow Chow (205)',
  'Eurasier (291) (Eurasian)',
  'Korea Jindo Dog (334)',
  'Akita (255)',
  'American Akita (344)',
  'Hokkaïdo (261)',
  'Kai (317)',
  'Kishu (318)',
  'Nihon Supittsu (262) (Japanese Spitz)',
  'Shiba (257)',
  'Shikoku (319)'
].each do |name|
  Section.find_by(:description => 'Asian Spitz and related breeds').breeds.where(name: name).first_or_create!
end

#
# Group V - Section 6 - Breeds
#
[
  'Canaan Dog (273)',
  'Pharaoh Hound (248)',
  'Xoloitzcuintle (234)',
  'Perro sin pelo del Perú (310) (Peruvian Hairless Dog)',
  'Basenji (43)'
].each do |name|
  Section.find_by(:description => 'Primitive type').breeds.where(name: name).first_or_create!
end

#
# Group V - Section 6 - Varieties
#
%w(Standard
  Intermediate
  Miniature
).each do |name|
  Breed.where('name LIKE ?', '%Xoloitzcuintle%').first.varieties.where(name: name).first_or_create!
end

%w(Large
  Medium-sized
  Miniature
).each do |name|
  Breed.where('name LIKE ?', '%Perro sin pelo del Perú%').first.varieties.where(name: name).first_or_create!
end

#
# Group V - Section 7 - Breeds
#
[
  'Podenco Canario (329) (Canarian Warren Hound - Canarian Podenco)',
  'Podenco Ibicenco (89)',
  'Cirneco dell\'Etna (199)',
  'Podengo Português (94) (Portuguese Warren Hound - portuguese Podengo)'
].each do |name|
  Section.find_by(:description => 'Primitive type - Hunting Dogs').breeds.where(name: name).first_or_create!
end

#
# Group V - Section 7 - Varieties
#
[
  'Long and wire-haired',
  'Smooth and short-haired'
].each do |name|
  Breed.where('name LIKE ?', '%Podengo Português%').first.varieties.where(name: name).first_or_create!
end

[
  'Rough haired',
  'Smooth haired'
].each do |name|
  Breed.where('name LIKE ?', '%Podenco Ibicenco%').first.varieties.where(name: name).first_or_create!
end

#
# Group V - Section 7 - Subvarieties
#

%w(Medium-sized
  Large
  Small
).each do |name|
  Breed.where('name LIKE ?', '%Podengo Português%').first.
      varieties.where('name LIKE ?', '%Long and wire-haired%').first.subvarieties.where(name: name).first_or_create!
  Breed.where('name LIKE ?', '%Podengo Português%').first.
      varieties.where('name LIKE ?', '%Smooth and short-haired%').first.subvarieties.where(name: name).first_or_create!
end

#
# Group V - Section 8 - Breeds
#
[
  'Thai Ridgeback Dog (338)'
].each do |name|
  Section.find_by(:description => 'Primitive type Hunting Dogs with a ridge on the back').breeds.where(name: name).first_or_create!
end

###############################################
################## Group VI ###################
###############################################

#
# Group VI - Sections
#
[
  ['Section 1', 'Scenthounds'],
  ['Section 2', 'Leash (scent) Hounds'],
  ['Section 3', 'Related breeds']
].each do |name, description|
  Group.find_by(:description => 'Scenthounds and related breeds').sections.where(name: name, description: description).first_or_create!
end

#
# Group VI - Subsections
#
[
    ['Subsection 1.1', 'Large-sized Hounds'],
    ['Subsection 1.2', 'Medium-sized Hounds'],
    ['Subsection 1.3', 'Small-sized Hounds']
].each do |name, description|
  Section.find_by(:description => 'Scenthounds').subsections.where(name: name, description: description).first_or_create!
end

#
# Group VI - Subsection 1.1 - Breeds
#
[
  'Chien de Saint-Hubert (84) (Bloodhound)',
  'Billy (25)',
  'Français tricolore (219) (French Tricolour Hound)',
  'Français blanc et noir (220) (French White and Black Hound)',
  'Français blanc et orange (316) (French White and Orange Hound)',
  'Grand anglo-français tricolore (322) (Great Anglo-French Tricolour Hound)',
  'Grand anglo-français blanc et noir (323) (Great Anglo-French White and Black Hound)',
  'Grand anglo-français blanc et orange (324) (Great Anglo-French White and Orange Hound)',
  'Grand Bleu de Gascogne (22) (Great Gascony Blue)',
  'Gascon saintongeois (21)',
  'Grand griffon vendéen (282) (Grand Griffon Vendeen)',
  'English Foxhound (159)',
  'Otterhound (294)',
  'American Foxhound (303)',
  'Black and Tan Coonhound (300)'
].each do |name|
  Subsection.find_by(:description => 'Large-sized Hounds').breeds.where(name: name).first_or_create!
end

#
# Group VI - Subsection 1.2 - Breeds
#
[
  'Bosanski Ostrodlaki Gonic Barak (155) (Bosnian coarse-haired Hound - called Barak)',
  'Istarski Kratkodlaki Gonic (151) (Istrian short-haired Scent Hound)',
  'Istarski Ostrodlaki Gonic (152) (Istrian wire-haired Scent Hound)',
  'Posavski Gonic (154) (Scent Hound from the Save Valley)',
  'Sabueso Español (204) (Spanish Hound)',
  'Anglo-français de petite vénerie (325) (Medium-sized Anglo-French Hound)',
  'Ariégeois (20) (Ariège-Hound)',
  'Beagle-Harrier (290)',
  'Poitevin (24)',
  'Chien d\'Artois (28) (Artois Hound)',
  'Porcelaine (30)',
  'Petit bleu de Gascogne (31) (Small Gascony Blue)',
  'Briquet griffon vendéen (19) (Medium Griffon Vendeen)',
  'Griffon bleu de Gascogne (32) (Blue Gascony Griffon)',
  'Griffon fauve de Bretagne (66)',
  'Griffon Nivernais (17)',
  'Harrier (295)',
  'Hellinikos Ichnilatis (214) (Hellenic Hound)',
  'Segugio Italiano a pelo forte (198) (Italian Rough-haired segugio)',
  'Segugio Italiano a pelo raso (337) (Italian Short-haired Hound)',
  'Srpski Trobojni Gonic (229) (Serbian Tricolour Hound)',
  'Srpski Gonic (150) (Serbian Hound)',
  'Crnogorski Planinski Gonic (279) (Montenegrin Mountain Hound)',
  'Erdélyi Kopó (241) (Transylvanian Hound)',
  'Dunker (203) (Norwegian Hound)',
  'Haldenstøvare (267) (Halden Hound)',
  'Hygenhund (266) (Hygen Hound)',
  'Brandlbracke (Vieräugl) (63) (Austrian Black and Tan Hound)',
  'Steirische Rauhhaarbracke (62) (Coarse-haired Styrian Hound)',
  'Tiroler Bracke (68) (Tyrolean Hound)',
  'Ogar Polski (52) (Polish Hound)',
  'Schweizer Laufhund-Chien Courant Suisse (59) (Swiss Hound)',
  'Slovenský Kopov (244) (Slovakian Hound)',
  'Suomenajokoira (51) (Finnish Hound)',
  'Hamiltonstövare (132)',
  'Schillerstövare (131)',
  'Smålandsstövare (129)'
].each do |name|
  Subsection.find_by(:description => 'Medium-sized Hounds').breeds.where(name: name).first_or_create!
end

#
# Group VI - Subsection 1.2 - Varieties
#
[
  'Bernese Hound',
  'Jura Hound',
  'Lucerne Hound',
  'Schwyz Hound'
].each do |name|
  Breed.where('name LIKE ?', '%Schweizer Laufhund-Chien Courant Suisse%').first.
      varieties.where(name: name).first_or_create!
end

#
# Group VI - Subsection 1.3 - Breeds
#
[
  'Deutsche Bracke (299) (German Hound)',
  'Westfälische Dachsbracke (100) (Westphalian Dachsbracke)',
  'Basset artésien normand (34) (Artesian-Norman Basset)',
  'Basset bleu de Gascogne (35) (Blue Gascony Basset)',
  'Basset fauve de Bretagne (36) (Fawn Brittany Basset)',
  'Grand Basset griffon vendéen (33) (Grand Basset Griffon Vendeen)',
  'Petit Basset griffon vendéen (67) (Petit Basset Griffon Vendeen)',
  'Basset Hound (163)',
  'Beagle (161)',
  'Schweizerischer Niederlaufhund - Petit chien courant suisse (60) (Small Swiss Hound)',
  'Drever (130)'
].each do |name|
  Subsection.find_by(:description => 'Small-sized Hounds').breeds.where(name: name).first_or_create!
end

#
# Group VI - Subsection 1.3 - Varieties
#
[
  'Small bernese Hound',
  'Small Jura Hound',
  'Small Lucerne Hound',
  'Small Schwyz Hound'
].each do |name|
  Breed.where('name LIKE ?', '%Schweizerischer Niederlaufhund - Petit chien courant suisse%').first.
      varieties.where(name: name).first_or_create!
end

#
# Group VI - Section 2 - Breeds
#
[
  'Bayrischer Gebirgsschweisshund (217) (Bavarian Mountain Scenthound)',
  'Hannover\'scher Schweisshund (213) (Hanoverian Scenthound)',
  'Alpenländische Dachsbracke(254) (Alpine Dachsbracke)'
].each do |name|
  Section.find_by(:description => 'Leash (scent) Hounds').breeds.where(name: name).first_or_create!
end

#
# Group VI - Section 3 - Breeds
#
[
  'Dalmatinski pas (153) (Dalmatian)',
  'Rhodesian Ridgeback (146)'
].each do |name|
  Section.find_by(:description => 'Related breeds').breeds.where(name: name).first_or_create!
end


###############################################
################# Group VII ###################
###############################################

#
# Group VII - Sections
#
[
  ['Section 1', 'Continental Pointing Dogs'],
  ['Section 2', 'British and Irish Pointers and Setters']
].each do |name, description|
  Group.find_by(:description => 'Pointing Dogs').sections.where(name: name, description: description).first_or_create!
end

#
# Group VII - Subsections
#
[
  ['Subsection 1.1', 'Type Continental Pointing Dog'],
  ['Subsection 1.2', 'Spaniel type'],
  ['Subsection 1.3', '\'Griffon\' type']
].each do |name, description|
  Section.find_by(:description => 'Continental Pointing Dogs').subsections.where(name: name, description: description).first_or_create!
end

[
  ['Subsection 2.1', 'Pointer'],
  ['Subsection 2.2', 'Setter']
].each do |name, description|
  Section.find_by(:description => 'British and Irish Pointers and Setters').subsections.where(name: name, description: description).first_or_create!
end

#
# Group VII - Subsection 1.1 - Breeds
#
[
  'Gammel Dansk Hønsehund (281) (Old Danish Pointing Dog)',
  'Deutsch Kurzhaar (119) (German Short-haired Pointing Dog)',
  'Deutsch Drahthaar (98) (German Wire-haired Pointer)',
  'Pudelpointer (216)',
  'Deutsch Stichelhaar (232) (German Rough-haired Pointing Dog)',
  'Weimaraner (99)',
  'Perdiguero de Burgos (90) (Burgos Pointing Dog)',
  'Braque de l\'Ariège (177) (Ariege Pointing Dog)',
  'Braque d\'Auvergne (180) (Auvergne Pointer)',
  'Braque du Bourbonnais (179) (Bourbonnais Pointing Dog)',
  'Braque français, type Gascogne (grande taille) (133) (French Pointing Dog - Gascogne type)',
  'Braque français, type Pyrénées (petite taille) (134) (French Pointing Dog - Pyrenean type)',
  'Braque Saint-Germain (115) (St.Germain Pointer)',
  'Bracco Italiano (202) (Italian Pointing Dog)',
  'Drötzörü Magyar Vizsla (239) (Hungarian Wire-haired Pointing Dog)',
  'Rövidszörü Magyar Vizsla (57) (Hungarian Short-haired Pointing Dog)',
  'Perdigueiro Português (187) (Portuguese Pointing Dog)',
  'Slovenský Hrubosrsty Stavac (Ohar) (320) (Wire-haired Slovakian Pointer)'
].each do |name|
  Subsection.find_by(:description => 'Type Continental Pointing Dog').breeds.where(name: name).first_or_create!
end

#
# Group VII - Subsection 1.1 - Varieties
#
%w(Short-haired
  Long-haired
).each do |name|
  Breed.where('name LIKE ?', '%Weimaraner%').first.varieties.where(name: name).first_or_create!
end

[
  'White-Orange',
  'Chestnut roan'
].each do |name|
  Breed.where('name LIKE ?', '%Bracco Italiano%').first.varieties.where(name: name).first_or_create!
end

#
# Group VII - Subsection 1.2 - Breeds
#
[
  'Kleiner Münsterländer (102)',
  'Grosser Münsterländer Vorstehhund (118) (Large Munsterlander)',
  'Deutsch Langhaar (117) (German long-haired Pointing Dog)',
  'Epagneul bleu de Picardie (106) (Blue Picardy Spaniel)',
  'Epagneul Breton (95) (Brittany Spaniel)',
  'Epagneul français (175) (French Spaniel)',
  'Epagneul picard (108) (Picardy Spaniel)',
  'Epagneul de Pont-Audemer (114) (Pont-Audemer Spaniel)',
  'Drentsche Patrijshond (224) (Drentsche Partridge Dog)',
  'Stabyhoun (222) (Frisian Pointing Dog)'
].each do |name|
  Subsection.find_by(:description => 'Spaniel type').breeds.where(name: name).first_or_create!
end

#
# Group VII - Subsection 1.3 - Breeds
#
[
  'Griffon d\'arrêt à poil dur Korthals (107) (Wire-haired Pointing Griffon Korthals)',
  'Spinone Italiano (165) (Spinone)',
  'Ceský Fousek (245) (Bohemian wire-haired Pointing Griffon)'
].each do |name|
  Subsection.find_by(:description => '\'Griffon\' type').breeds.where(name: name).first_or_create!
end

#
# Group VII - Subsection 2.1 - Breeds
#
[
  'English Pointer (1)'
].each do |name|
  Subsection.find_by(:description => 'Pointer').breeds.where(name: name).first_or_create!
end

#
# Group VII - Subsection 2.2 - Breeds
#
[
  'English Setter (2)',
  'Gordon Setter (6)',
  'Irish Red Setter (120)',
  'Irish Red and White Setter (330)'
].each do |name|
  Subsection.find_by(:description => 'Setter').breeds.where(name: name).first_or_create!
end


###############################################
################ Group VIII ###################
###############################################

#
# Group VIII - Sections
#
[
    ['Section 1', 'Retrievers'],
    ['Section 2', 'Flushing Dogs'],
    ['Section 3', 'Water Dogs']
].each do |name, description|
  Group.find_by(:description => 'Retrievers - Flushing Dogs - Water Dogs').sections.where(name: name, description: description).first_or_create!
end

#
# Group VIII - Section 1 - Breeds
#
[
  'Nova Scotia Duck Tolling Retriever (312)',
  'Curly Coated Retriever (110)',
  'Flat Coated Retriever (121)',
  'Labrador Retriever (122)',
  'Golden Retriever (111)',
  'Chesapeake Bay Retriever (263)'
].each do |name|
  Section.find_by(:description => 'Retrievers').breeds.where(name: name).first_or_create!
end

#
# Group VIII - Section 2 - Breeds
#
[
  'Deutscher Wachtelhund (104) (German Spaniel)',
  'Clumber Spaniel (109)',
  'English Cocker Spaniel (5)',
  'Field Spaniel (123)',
  'Sussex Spaniel (127)',
  'English Springer Spaniel (125)',
  'Welsh Springer Spaniel (126)',
  'Nederlandse Kooikerhondje (314)',
  'American Cocker Spaniel (167)'
].each do |name|
  Section.find_by(:description => 'Flushing Dogs').breeds.where(name: name).first_or_create!
end

#
# Group VIII - Section 2 - Varieties
#
[
  'Solid colours',
  'Parti-colours',
  'Tricolours',
  'Roans'
].each do |name|
  Breed.where('name LIKE ?', '%English Cocker Spaniel%').first.varieties.where(name: name).first_or_create!
end

[
  'Black',
  'Any solid colour other than black (ASCOB)',
  'Parti-colours'
].each do |name|
  Breed.where('name LIKE ?', '%American Cocker Spaniel%').first.varieties.where(name: name).first_or_create!
end

#
# Group VIII - Section 3 - Breeds
#
[
  'Perro de agua español (336) (Spanish Waterdog)',
  'Barbet (105) (French Water Dog)',
  'Irish Water Spaniel (124)',
  'Lagotto Romagnolo (298) (Romagna Water Dog)',
  'Wetterhoun (221) (Frisian Water Dog)',
  'Cão de agua Português (37) (Portuguese Water Dog)',
  'American Water Spaniel (301)'
].each do |name|
  Section.find_by(:description => 'Water Dogs').breeds.where(name: name).first_or_create!
end

#
# Group VIII - Section 3 - Varieties
#
[
  'Long and wavy',
  'Shorter and curly'
].each do |name|
  Breed.where('name LIKE ?', '%Cão de agua Português%').first.varieties.where(name: name).first_or_create!
end



###############################################
################### Group IX ##################
###############################################

#
# Group IX - Sections
#
[
  ['Section 1', 'Bichons and related breeds'],
  ['Section 2', 'Poodle'],
  ['Section 3', 'Small Belgian Dogs'],
  ['Section 4', 'Hairless Dogs'],
  ['Section 5', 'Tibetan breeds'],
  ['Section 6', 'English Toy Spaniels'],
  ['Section 7', 'Japan Chin and Pekingese'],
  ['Section 8', 'Small Molossian type Dogs'],
  ['Section 9', 'Chihuahueño'],
  ['Section 10', 'Continental Toy Spaniel'],
  ['Section 11', 'Kromfohrländer'],

].each do |name, description|
  Group.find_by(:description => 'Companion and Toy Dogs').sections.where(name: name, description: description).first_or_create!
end

#
# Group IX - Subsections
#
[
  ['Subsection 1.1', 'Bichons'],
  ['Subsection 1.2', 'Coton de Tuléar'],
  ['Subsection 1.3', 'Petit chien lion']
].each do |name, description|
  Section.find_by(:description => 'Bichons and related breeds').subsections.where(name: name, description: description).first_or_create!
end

[
  ['Subsection 3.1', 'Griffons'],
  ['Subsection 3.2', 'Petit Brabançon']
].each do |name, description|
  Section.find_by(:description => 'Small Belgian Dogs').subsections.where(name: name, description: description).first_or_create!
end

#
# Group IX - Subsection 1.1 - Breeds
#
[
  'Maltese (65)',
  'Bichon Havanais (250) (Havanese)',
  'Bichon à poil frisé (215) (Bichon Frise)',
  'Bolognese (196)'
].each do |name|
  Subsection.find_by(:description => 'Bichons').breeds.where(name: name).first_or_create!
end

#
# Group IX - Subsection 1.2 - Breeds
#
[
  'Coton de Tuléar (283) (Coton de Tulear)'
].each do |name|
  Subsection.find_by(:description => 'Coton de Tuléar').breeds.where(name: name).first_or_create!
end

#
# Group IX - Subsection 1.3 - Breeds
#
[
  'Petit chien lion (233) (Little Lion Dog)'
].each do |name|
  Subsection.find_by(:description => 'Petit chien lion').breeds.where(name: name).first_or_create!
end

#
# Group IX - Section 2 - Breeds
#
[
  'Caniche (172) (Poodle)'
].each do |name|
  Section.find_by(:description => 'Poodle').breeds.where(name: name).first_or_create!
end

#
# Group IX - Section 2 - Varieties
#
[
  'Standard',
  'Medium size',
  'Miniature',
  'Toy'
].each do |name|
  Breed.where('name LIKE ?', '%Caniche%').first.varieties.where(name: name).first_or_create!
end

#
# Group IX - Section 2 - Subvarieties
#
[
  'Brown',
  'Black',
  'White',
  'Grey',
  'Orange fawn (Apricot)',
  'Red fawn'
].each do |name|
  Breed.where('name LIKE ?', '%Caniche%').first.
      varieties.where('name LIKE ?', '%Standard%').first.subvarieties.where(name: name).first_or_create!
  Breed.where('name LIKE ?', '%Caniche%').first.
      varieties.where('name LIKE ?', '%Medium size%').first.subvarieties.where(name: name).first_or_create!
  Breed.where('name LIKE ?', '%Caniche%').first.
      varieties.where('name LIKE ?', '%Miniature%').first.subvarieties.where(name: name).first_or_create!
end

#
# Group IX - Subsection 3.1 - Breeds
#
[
  'Griffon belge (81)',
  'Griffon bruxellois (80)'
].each do |name|
  Subsection.find_by(:description => 'Griffons').breeds.where(name: name).first_or_create!
end

#
# Group IX - Subsection 3.2 - Breeds
#
[
  'Petit Brabançon (82)'
].each do |name|
  Subsection.find_by(:description => 'Petit Brabançon').breeds.where(name: name).first_or_create!
end

#
# Group IX - Section 4 - Breeds
#
[
  'Chinese Crested Dog (288)'
].each do |name|
  Section.find_by(:description => 'Hairless Dogs').breeds.where(name: name).first_or_create!
end

#
# Group IX - Section 4 - Varieties
#
[
  'Hairless',
  'Powder puff',
].each do |name|
  Breed.where('name LIKE ?', '%Chinese Crested Dog%').first.varieties.where(name: name).first_or_create!
end

#
# Group IX - Section 5 - Breeds
#
[
  'Lhasa Apso (227)',
  'Shih Tzu (208)',
  'Tibetan Spaniel (231)',
  'Tibetan Terrier (209)'
].each do |name|
  Section.find_by(:description => 'Tibetan breeds').breeds.where(name: name).first_or_create!
end

#
# Group IX - Section 6 - Breeds
#
[
  'Cavalier King Charles Spaniel (136)',
  'King Charles Spaniel (128)'
].each do |name|
  Section.find_by(:description => 'English Toy Spaniels').breeds.where(name: name).first_or_create!
end

#
# Group IX - Section 6 - Varieties
#
[
  'Black and tan',
  'Ruby',
  'Blenheim',
  'Tricolour'
].each do |name|
  Breed.where(name: 'Cavalier King Charles Spaniel (136)').first.varieties.where(name: name).first_or_create!
  Breed.where(name: 'King Charles Spaniel (128)').first.varieties.where(name: name).first_or_create!
end

#
# Group IX - Section 7 - Breeds
#
[
  'Pekingese (207)',
  'Chin (206) (Japanese Chin)'
].each do |name|
  Section.find_by(:description => 'Japan Chin and Pekingese').breeds.where(name: name).first_or_create!
end

#
# Group IX - Section 8 - Breeds
#
[
    'Bouledogue français (101) (French Bulldog)',
    'Pug (253)',
    'Boston Terrier (140)'
].each do |name|
  Section.find_by(:description => 'Small Molossian type Dogs').breeds.where(name: name).first_or_create!
end

#
# Group IX - Section 8 - Varieties
#
%w(
  Silver
  Apricot
  Fawn
  Black
).each do |name|
  Breed.where('name LIKE ?', '%Pug%').first.varieties.where(name: name).first_or_create!
end

[
  'Uniformly fawn, brindled or not, or with limited white patching',
  'Fawn, brindled or not, with medium or predominant patching'
].each do |name|
  Breed.where('name LIKE ?', '%Bouledogue français%').first.varieties.where(name: name).first_or_create!
end

#
# Group IX - Section 9 - Breeds
#
[
  'Chihuahueño (Chihuahua) (218)'
].each do |name|
  Section.find_by(:description => 'Chihuahueño').breeds.where(name: name).first_or_create!
end

#
# Group IX - Section 9 - Varieties
#
%w(
  Long-haired
  Smooth-haired
).each do |name|
  Breed.where('name LIKE ?', '%Chihuahueño%').first.varieties.where(name: name).first_or_create!
end

#
# Group IX - Section 10 - Breeds
#
[
  'Epagneul nain Continental (77) (Continental Toy Spaniel)'
].each do |name|
  Section.find_by(:description => 'Continental Toy Spaniel').breeds.where(name: name).first_or_create!
end

#
# Group IX - Section 10 - Varieties
#
[
  'Papillon - with erect ears',
  'Phalène - with drooping ears'
].each do |name|
  Breed.where('name LIKE ?', '%Epagneul nain Continental%').first.varieties.where(name: name).first_or_create!
end

#
# Group IX - Section 11 - Breeds
#
[
  'Kromfohrländer (192)'
].each do |name|
  Section.find_by(:description => 'Kromfohrländer').breeds.where(name: name).first_or_create!
end



###############################################
#################### Group X ##################
###############################################

#
# Group IX - Sections
#
[
  ['Section 1', 'Long-haired or fringed Sighthounds'],
  ['Section 2', 'Rough-haired Sighthounds'],
  ['Section 3', 'Short-haired Sighthounds']
].each do |name, description|
  Group.find_by(:description => 'Sighthounds').sections.where(name: name, description: description).first_or_create!
end

#
# Group X - Section 1 - Breeds
#
[
  'Afghan Hound (228)',
  'Saluki (269)',
  'Russkaya Psovaya Borzaya (193)  (Borzoi - Russian hunting Sighthound)'
].each do |name|
  Section.find_by(:description => 'Long-haired or fringed Sighthounds').breeds.where(name: name).first_or_create!
end

#
# Group X - Section 1 - Varieties
#
%w(Fringed
  Smooth
).each do |name|
  Breed.where('name LIKE ?', '%Saluki%').first.varieties.where(name: name).first_or_create!
end

#
# Group X - Section 2 - Breeds
#
[
  'Irish Wolfhound (160)',
  'Deerhound (164)'
].each do |name|
  Section.find_by(:description => 'Rough-haired Sighthounds').breeds.where(name: name).first_or_create!
end

#
# Group X - Section 3 - Breeds
#
[
  'Galgo español (285) (Spanish Greyhound)',
  'Greyhound (158)',
  'Whippet (162)',
  'Piccolo Levriero Italiano (200) (Italian Greyhound)',
  'Magyar Agar (240) (Hungarian Greyhound)',
  'Azawakh (307)',
  'Sloughi (188) (Arabian Greyhound)',
  'Chart Polski (333) (Polish Greyhound)'
].each do |name|
  Section.find_by(:description => 'Short-haired Sighthounds').breeds.where(name: name).first_or_create!
end