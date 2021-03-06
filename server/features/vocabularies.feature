Feature: Vocabularies

  @auth
  Scenario: List category vocabulary
    Given the "vocabularies"
      """
      [{"_id": "categories", "items": [{"name": "National", "value": "A", "is_active": true}, {"name": "Domestic Sports", "value": "T", "is_active": false}]}]
      """
    When we get "/vocabularies/categories"
    Then we get existing resource
      """
      {"_id": "categories", "items": [{"name": "National", "value": "A"}]}
      """

  @auth
  Scenario: List default preferred categories vocabulary
    Given the "vocabularies"
      """
      [{
          "_id": "default_categories",
          "items": [
              {"is_active": true, "qcode": "a"},
              {"is_active": false, "qcode": "b"},
              {"is_active": true, "qcode": "c"}
          ]
        }
      ]
      """
    When we get "/vocabularies/default_categories"
    Then we get existing resource
      """
      {"_id": "default_categories", "items": [{"qcode": "a"}, {"qcode": "c"}]}
      """

  @auth
  Scenario: List newsvalue vocabulary
    Given the "vocabularies"
      """
      [{"_id": "newsvalue", "items":[{"name":"1","value":"1", "is_active": true},{"name":"2","value":"2","is_active": true},{"name":"3","value":"3", "is_active": true},{"name":"4","value":"4", "is_active": false}]}]
      """
    When we get "/vocabularies/newsvalue"
    Then we get existing resource
      """
      {"_id": "newsvalue", "items":[{"name":"1","value":"1"},{"name":"2","value":"2"},{"name":"3","value":"3"}]}
      """

  @auth
  Scenario: List vocabularies
    Given the "vocabularies"
      """
      [
        {"_id": "categories", "items": [{"name": "National", "value": "A", "is_active": true}, {"name": "Domestic Sports", "value": "T", "is_active": false}]},
        {"_id": "newsvalue", "items":[{"name":"1","value":"1", "is_active": true},{"name":"2","value":"2","is_active": true},{"name":"3","value":"3", "is_active": true},{"name":"4","value":"4", "is_active": false}]}
      ]
      """
    When we get "/vocabularies"
    Then we get existing resource
      """
      {
        "_items" :
          [
            {"_id": "categories", "items": [{"name": "National", "value": "A"}]},
            {"_id": "newsvalue", "items":[{"name":"1","value":"1"},{"name":"2","value":"2"},{"name":"3","value":"3"}]}
          ]
      }
      """