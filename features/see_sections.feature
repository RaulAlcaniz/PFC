Feature: See sections
  Una sección es una categoría perteneciente a un único grupo. Cada sección puede estar a su vez dividida en
  subsecciones con idénticas características pero con alguna otra peculiaridad adicional. Las categorías pueden contener
  razas de perros. Una categoría está compuesta obligatoriamente de un identificador, el grupo al que pertenece, un
  número de sección y un campo de descripción.

  La siguiente tabla muestra un ejemplo de sintaxis de secciones para 3 grupos específicos:
  """
  |SECTION ID|Group id|Section number|Description                           |
  |1         |1       |1             |Sheepdogs                             |
  |2         |1       |2             |Cattle Dogs (except Swiss Cattle dogs)|
  |3         |2       |1             |Large and medium-sized Terriers       |
  |4         |2       |2             |Small-sized Terriers                  |
  |5         |2       |3             |Bull type Terriers                    |
  |6         |2       |4             |Toy Terriers                          |
  |7         |3       |1             |Bichons and related breeds            |
  |8         |3       |2             |Poodle                                |
  |9         |3       |3             |Small Belgian Dogs                    |
  |10        |3       |4             |Hairless Dogs                         |
  |11        |3       |5             |Tibetan breeds                        |
  |12        |3       |6             |Chihuahueño                           |
  |13        |3       |7             |English Toy Spaniels                  |
  |14        |3       |8             |Japan Chin and Pekingese              |
  """
  Background:
    Existen secciones y grupos con campos específicos
    Given groups with these entries:
      |GROUP ID|Name       |Description                                        |
      |1       |Group I    |Sheepdogs and Cattle Dogs (except Swiss Cattle Dog)|
      |2       |Group III  |Terriers                                           |
      |3       |Group IX   |Companion and Toy Dogs                             |
    And sections with these entries:
      |SECTION ID|GROUP ID|Section number|Description                           |
      |1         |1       |1             |Sheepdogs                             |
      |2         |1       |2             |Cattle Dogs (except Swiss Cattle dogs)|
      |3         |2       |1             |Large and medium-sized Terriers       |
      |4         |2       |2             |Small-sized Terriers                  |
      |5         |2       |3             |Bull type Terriers                    |
      |6         |2       |4             |Toy Terriers                          |
      |7         |3       |1             |Bichons and related breeds            |
      |8         |3       |2             |Poodle                                |
      |9         |3       |3             |Small Belgian Dogs                    |

    Scenario: See sections available in the group 2
      When the group "2" page is visited
      Then the group page should content
        |Section number|Description                    |
        |1             |Large and medium-sized Terriers|
        |2             |Small-sized Terriers           |
        |3             |Bull type Terriers             |
        |4             |Toy Terriers                   |