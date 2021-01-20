#Feature:  CMC1002
#  话务统计-以天维度
#  Scenario Outline: without nothing
#    Given api "commu/record/count/day"
#    And param
#    """
#    callerUserId: ""
#    dptIds: ""
#    createdTimeStart: ""
#    createdTimeEnd: ""
#    countType: ""
#    """
#    And CookieX
#    | TOKEN | ${token} |
#    When get
#    Then JSONPATH_ASSERT "<resultCode>" equals "<code>"
#    Examples:
#    | resultCode | code   |
#    | result     | GB2001 |
#
#  Scenario Outline: with time
#    Given api "commu/record/count/day"
#    And param
#    """
#    callerUserId: ""
#    dptIds: ""
#    createdTimeStart: "2020-12-10"
#    createdTimeEnd: "2021-01-09"
#    countType: ""
#    """
#    And CookieX
#    | TOKEN | ${token} |
#    When get
#    Then JSONPATH_ASSERT "<resultCode>" equals "<code>"
#    Examples:
#      | resultCode | code   |
#      | result     | 000000 |
#
#  Scenario Outline: with user Id
#    Given api "commu/record/count/day"
#    And param
#    """
#    callerUserId: "USER20201112220000000053"
#    dptIds: ""
#    createdTimeStart: "2020-12-10"
#    createdTimeEnd: "2021-01-09"
#    countType: ""
#    """
#    And CookieX
#    | TOKEN | ${token} |
#    When get
#    Then JSONPATH_ASSERT "<resultCode>" equals "<code>"
#    Examples:
#      | resultCode | code   |
#      | result     | 000000 |
#
#  Scenario Outline: with user depart Id
#    Given api "commu/record/count/day"
#    And param
#    """
#    callerUserId: ""
#    dptIds: "DPT20200409010000002410"
#    createdTimeStart: "2020-12-10"
#    createdTimeEnd: "2021-01-09"
#    countType: ""
#    """
#    And CookieX
#      | TOKEN | ${token} |
#    When get
#    Then JSONPATH_ASSERT "<resultCode>" equals "<code>"
#    Examples:
#      | resultCode | code   |
#      | result     | 000000 |
#
#  Scenario Outline: with countType
#    Given api "commu/record/count/day"
#    And param
#    """
#    callerUserId: ""
#    dptIds: "DPT20200409010000002410"
#    createdTimeStart: "2020-12-10"
#    createdTimeEnd: "2021-01-09"
#    countType: "D"
#    """
#    And CookieX
#      | TOKEN | ${token} |
#    When get
#    Then JSONPATH_ASSERT "<resultCode>" equals "<code>"
#    Examples:
#      | resultCode | code   |
#      | result     | 000000 |
