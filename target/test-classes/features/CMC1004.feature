#Feature: CMC1004
#  今日实时统计
#  Scenario Outline: with out token
#    Given api "commu/record/realtime"
#    And param
#    """
#    schoolId: ""
#    """
#    When get
#    Then JSONPATH_ASSERT "<resultCode>" equals "<code>"
#    Examples:
#    | resultCode | code |
#    | result | 000000 |
#
#  Scenario Outline: with  token but wrong schoolId
#    Given api "commu/record/realtime"
#    And param
#    """
#    schoolId: "127hrqufh!@#"
#    """
#    And CookieX
#    | TOKEN | ${token} |
#    When get
#    Then JSONPATH_ASSERT "<resultCode>" equals "<code>"
#    Examples:
#      | resultCode | code |
#      | result | 000000 |
#
#
#  Scenario Outline: with  token but wrong schoolId
#    Given api "commu/record/realtime"
#    And param
#    """
#    schoolId: 127hrqufh!@#
#    """
#    And CookieX
#    | TOKEN | ${token} |
#    When get
#    Then JSONPATH_ASSERT "<resultCode>" equals "<code>"
#    Examples:
#      | resultCode | code |
#      | result | 000000 |