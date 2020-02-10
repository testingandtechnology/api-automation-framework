Feature: Verify the stub of API super match consent

  Scenario: [C1234] - Get super match consent successfully
    Given url stubUrl
    And path '/super/api/member/v1/plans/BF/members/100200'
    When method GET
    Then status 200
    And print response
    And match response ===
    """
    {
        _links: [
            {
                "rel": "#string",
                "href": "#string"
            }
        ],
        resource: {
             planCode: "BF",
             id: "#number",
             memberReference: "#string",
             membersTypeStatus: "#string",
             customerReference: "#string",
             planTypeStatus: "#string",
             title: "#string",
             titleCode: "#string",
             givenNames: "#string",
             familyName: "#string",
             membersGenderType: "#string",
             aboriginalTorresStraitIslander: "#string",
             birthDate: "#string",
             ageInYears: "#number",
             deathDate: "#null",
             applicationReceivedDate: "#string",
             classificationId: "#string",
             division: {
                id: "#number",
                reference: "#string",
                description: {
                    longDescription: "#string",
                    shortDescription: "#string"
                }
            },
            dateJoinedFund: "#string",
            isMySuper: "#boolean",
            investmentDefinitionId: "#string",
            membersAddressModel: [
                {
                    "membersAddressType": "#string",
                    "addressLine1": "#string",
                    "addressLine2": "#null",
                    "suburb": "#string",
                    "state": "#string",
                    "postCode": "#string",
                    "countryCode": "#string",
                    "deliveryPointIdentifier": "#number",
                    "membersAddressStatus": "#string"
                },
                {
                    "membersAddressType": "#string",
                    "addressLine1": "#string",
                    "addressLine2": "#null",
                    "suburb": "#string",
                    "state": "#string",
                    "postCode": "#string",
                    "countryCode": "#string",
                    "deliveryPointIdentifier": "#number",
                    "membersAddressStatus": "#string"
                }
            ],
            faxNumber: "#null",
            email: "#string",
            secondaryEmail: "#null",
            membersEmailStatus: "#string",
            phoneNumber: "#null",
            mobileNumber: "#string",
            workNumber: "#null",
            tfnStatus: "#string",
            tfn: "#string",
            cardIssueDate: "#string",
            isDefinedBenefitMember: "#boolean",
            isAdvisedMember: "#boolean",
            isRestrictedFromUser: "#boolean",
            lostMemberIndicatorCode: "#string",
            lostMemberIndicatorDescription: "#string",
            lostMemberIsExcludedFromReport: "#boolean",
            preservationAge: "#number",
            earlyRetirementDate: "#string",
            retirementDate: "#string",
            eligibleServiceStartDate: "#string",
            occupationCode: "#string",
            stopPaymentDate: "#null",
            stopPaymentReason: "#null",
            lastAction: "#null",
            nextBestAction: "#null",
            retirementGoalPerAnnum: "#number",
            retirementAge: "#number",
            callToAction: "#null",
            terminatedPlanDate: "#string",
            eligibleServicePeriodStartDate: "#string",
            memberContributionRates: "#array",
            superMatchConsent: "#null",
            isPrivacyConsentGiven: "#boolean",
            occupationalRating: {
                occupation: {
                    code: "#string",
                    description: {
                        longDescription: "#string",
                        shortDescription: "#string"
                    }
                }
            },
            correspondenceRules: [
                {
                    correspondenceType: {
                        code: "#string",
                        description: {
                            longDescription: "#string",
                            shortDescription: "#string"
                        }
                    },
                    addressIndicator: "#string",
                    returnCount: "#number"
                }
            ],
            continuingWorkTestDetails: {
                currentFinancialYearStatus: "#string",
                continuingWorkTests: "#null"
            },
            memberRestrictions: "#array",
            classificatonDescription: {
                longDescription: "#string",
                shortDescription: "#string"
            },
            tfnNotificationDate: "#string",
            pleaseResolveNotices: "#null"
        },
        message: "#string"
      }
    """