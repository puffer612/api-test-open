#Feature: CMC1003
#  话务统计，义员工为维度
#  Scenario Outline: with out token
#    Given api "commu/record/count/ee"
#    And param
#    """
#    pageIndex: 0
#    pageSize: 0
#    callerUserId: ""
#    dptIds: ""
#    channelType: ""
#    createdTimeStart: "2020-12-10"
#    createdTimeEnd: "2021-01-09"
#    countType: ""
#    """
#    When get
#    Then JSONPATH_ASSERT "<resultCode>" equals "<code>"
#    Examples:
#    | resultCode | code   |
#    | result     | GB2004 |
#
#  Scenario Outline: with  token
#    Given api "commu/record/count/ee"
#    And param
#    """
#    pageIndex: 1
#    pageSize: 0
#    callerUserId: ""
#    dptIds: ""
#    channelType: ""
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
#  Scenario Outline: wrong start and end time
#    Given api "commu/record/count/ee"
#    And param
#    """
#    pageIndex: 0
#    pageSize: 10
#    callerUserId: ""
#    dptIds: ""
#    channelType: ""
#    createdTimeStart: "2021-01-10"
#    createdTimeEnd: "2020-12-09"
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
#  Scenario Outline: with out wrong user
#    Given api "commu/record/count/ee"
#    And param
#    """
#    pageIndex: "0"
#    pageSize: "0"
#    callerUserId: "xxxxjgoajpgjkapogkap"
#    dptIds: ""
#    channelType: ""
#    createdTimeStart: "2021-01-10"
#    createdTimeEnd: "2020-12-09"
#    countType: ""
#    """
#    And CookieX
#      | TOKEN | ${token} |
#    When get
#    Then JSONPATH_ASSERT "<resultCode>" equals "<code>"
#    Examples:
#      | resultCode | code   |
#      | result     | 000000 |