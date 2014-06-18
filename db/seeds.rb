# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#
# Groups
#
[
    ['Group I', 'Sheepdogs and Cattle Dogs (except Swiss Cattle Dogs)'],
    ['Group II', 'Pinscher and Schnauzer - Molossoid Breeds - Swiss Mountain and Cattle Dogs'],
    ['Group III', 'Terriers'],
    ['Group IV', 'Dachshunds'],
    ['Group V', 'Spitz and Primitive types'],
    ['Group VI', 'Scenthounds and Related Breeds'],
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
  Group.find_by(:description => 'Sheepdogs and Cattle Dogs (except Swiss Cattle Dogs)').sections.where(name: name, description: description).first_or_create!
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
  Group.find_by(:description => 'Pinscher and Schnauzer - Molossoid Breeds - Swiss Mountain and Cattle Dogs').sections.where(name: name, description: description).first_or_create!
end

#
# Group II - Subsections
#
[
  ['1.1', 'Pinscher'],
  ['1.2', 'Schnauzer'],
  ['1.3', 'Smoushond'],
  ['1.4', 'Russkiy Tchiorny Terrier']
].each do |name, description|
  Section.find_by(:description => 'Pinscher and Schnauzer type').subsections.where(name: name, description: description).first_or_create!
end

[
  ['2.1', 'Mastiff type'],
  ['2.2', 'Mountain type'],
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
  'Cane Corso Italiano (343) (Italian Corso Dog)',
  'Tosa (260)',
  'Cão Fila de São Miguel (340) (Saint Miguel Cattle Dog)'
].each do |name|
  Subsection.find_by(:description => 'Mastiff type').breeds.where(name: name).first_or_create!
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
  'Skye Terrier (75)',
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
  ['Section 7', 'Primitive type - Hunting Dogs']
].each do |name, description|
  Group.find_by(:description => 'Spitz and Primitive types').sections.where(name: name, description: description).first_or_create!
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
# Group V - Section 7 - Breeds
#
[
  'Podenco Canario (329) (Canarian Warren Hound - Canarian Podenco)',
  'Podenco Ibicenco (89)',
  'Cirneco dell\'Etna (199)',
  'Podengo Português (94) (Portuguese Warren Hound - portuguese Podengo)',
  'Thai Ridgeback Dog (338)'
].each do |name|
  Section.find_by(:description => 'Primitive type - Hunting Dogs').breeds.where(name: name).first_or_create!
end