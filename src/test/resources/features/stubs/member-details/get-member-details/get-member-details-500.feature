Feature: Verify the stub of API super match consent

  Scenario: Get super match consent successfully
    Given url stubUrl
    And path '/super/api/member/v1/plans/BF/members/100500'
    When method GET
    Then status 500
    And print response
    And match response ===
    """
    {
        message: "#string"
    }
    """