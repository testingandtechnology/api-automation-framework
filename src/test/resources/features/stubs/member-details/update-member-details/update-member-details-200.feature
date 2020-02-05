Feature: Verify the stub of API super match consent

  Scenario: Get super match consent successfully
    Given url stubUrl
    And path '/super/api/member/v1/plans/BF/members/120200'
    And request {planCode:"ABCD"}
    When method PUT
    Then status 200
    And print response
    And match response ===
    """
    {

        resource: {
          planCode: "",
          id: "#number",
          memberReference: "#string",
          membersTypeStatus: "#string",
          customerReference: "",
          planTypeStatus: "#string",
          title: "#string",
          titleCode: "#string",
          givenNames: "#string",
          familyName: "#string",
          membersGenderType: "#string",
          aboriginalTorresStraitIslander: "",
          birthDate: "#string",
          ageInYears: "#number",
          deathDate: "",
          applicationReceivedDate: "",
          classificationId: "",
          division: {
            id: "#number",
            reference: "",
            description: {
              shortDescription: "",
              longDescription: ""
            }
          },
          dateJoinedFund: "",
          isMySuper: "#boolean",
          investmentDefinitionId: "",
          membersAddressModel: [
            {
              "membersAddressType": "",
              "addressLine1": "",
              "addressLine2": "",
              "suburb": "",
              "state": "",
              "postCode": "",
              "countryCode": "",
              "deliveryPointIdentifier": "#number",
              "membersAddressStatus": ""
            }
          ],
          faxNumber: "",
          email: "#string",
          secondaryEmail: "",
          membersEmailStatus: "",
          phoneNumber: "",
          mobileNumber: "",
          workNumber: "",
          tfnStatus: "",
          tfn: "",
          cardIssueDate: "",
          isDefinedBenefitMember: "#boolean",
          isAdvisedMember: "#boolean",
          isRestrictedFromUser: "#boolean",
          lostMemberIndicatorCode: "",
          lostMemberIndicatorDescription: "",
          lostMemberIsExcludedFromReport: "#boolean",
          preservationAge: "#number",
          earlyRetirementDate: "",
          retirementDate: "",
          eligibleServiceStartDate: "",
          occupationCode: "",
          stopPaymentDate: "",
          stopPaymentReason: {
            code: "",
            description: {
              shortDescription: "",
              longDescription: ""
            }
          },
          lastAction: "",
          nextBestAction: "",
          retirementGoalPerAnnum: "#number",
          retirementAge: "#number",
          callToAction: "",
          terminatedPlanDate: "",
          eligibleServicePeriodStartDate: "",
          memberContributionRates: [
            {
              "contributionRate": "#number",
              "effectiveDate": ""
            }
          ],
          superMatchConsent: {
            consentCode: "",
            nominationDate: "",
            sourceCode: {
              code: "",
              description: {
                shortDescription: "",
                longDescription: ""
              }
            }
          },
          isPrivacyConsentGiven: "#boolean",
          occupationalRating: {
            occupation: {
              code: "",
              description: {
                shortDescription: "",
                longDescription: ""
              }
            }
          },
          correspondenceRules: [
            {
              "correspondenceType": {
                "code": "",
                "description": {
                  "shortDescription": "",
                  "longDescription": ""
                }
              },
              "addressIndicator": "",
              "returnCount": "#number"
            }
          ],
          continuingWorkTestDetails: {
            currentFinancialYearStatus: "",
            continuingWorkTests: [
              {
                "effectiveDate": "",
                "isPassed": "#boolean",
                "exemptStatus": ""
              }
            ]
          },
          memberRestrictions: [
            {
              "code": "",
              "description": ""
            }
          ],
          classificatonDescription: {
            shortDescription: "",
            longDescription: ""
          },
          tfnNotificationDate: "",
          pleaseResolveNotices: [
            {
              "pleaseResolveNoticeId": "#number",
              "status": "",
              "statusReason": {
                "code": "",
                "description": {
                  "shortDescription": "",
                  "longDescription": ""
                }
              }
            }
          ]
        },
        message: "",
        _links: [
          {
            "rel": "",
            "href": ""
          }
        ]
      }

    """