Feature: See groups
  Un grupo es un conjunto de secciones, las cuáles tienen características específicas para cara raza de canes. Cada
  grupo tendrá un nombre de grupo, un identificador, y una descripción, que serán las razas que componen el grupo.

  La siguiente tabla muestra un ejemplo de sintaxis de 3 grupos específicos:

  """
  |GROUP ID|Name     |Description                                         |
  |1       |Group I  |Sheepdogs and Cattle Dogs (except Swiss Cattle Dogs)|
  |2       |Group III|Terriers                                            |
  |3       |Group IX |Companion and Toy Dogs                              |
  """

  Background:
    Existen grupos con un nombre y una descripción específica
    Given groups with these entries:
      |GROUP ID|Name       |Description                                        |
      |1       |Group I    |Sheepdogs and Cattle Dogs (except Swiss Cattle Dog)|
      |2       |Group III  |Terriers                                           |
      |3       |Group IX   |Companion and Toy Dogs                             |
  Scenario: A visit wants see what groups are defined
    When the standards and nomenclature page is visited
    Then the standards and nomenclature page should content:
      |GROUP ID|Name       |Description                                        |
      |1       |Group I    |Sheepdogs and Cattle Dogs (except Swiss Cattle Dog)|
      |2       |Group III  |Terriers                                           |
      |3       |Group IX   |Companion and Toy Dogs                             |

  Scenario: A visit wants see a specific group properties
    When the standards and nomenclature page is visited
    And I follow "Group I"
    Then I should be on the group page for "Group I"