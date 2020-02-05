Feature: Verify the stub of API super match consent

  Scenario: Get super match consent successfully
    Given url stubUrl
    And path '/super/api/member/v1/plans/BF/members/100401'
    And request {error:"ABCD"}
    When method PUT
    Then status 401
    And print response
    And match response ===
    """
    {
      error: "#string"
    }
    """