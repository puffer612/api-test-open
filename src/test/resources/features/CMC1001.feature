#Feature: CMC1001
#  话务查询列表
#  Scenario Outline: all things is null
#    Given api "commu/record/search"
#    And param
#    """
#    pageIndex:
#    pageSize:
#    reciverName: ""
#    reciverPhone: ""
#    callerUserId: ""
#    dptIds: ""
#    schoolId: ""
#    voiceStatus: ""
#    channelType: ""
#    durationMin:
#    durationMax:
#    createdTimeStart: ""
#    createdTimeEnd: ""
#    """
#    When get
#    Then JSONPATH_ASSERT "<resultCode>" equals "<code>"
#    Examples:
#    | resultCode | code   |
#    | result     | GB2004 |
#
#  Scenario Outline: all things is null but with token
#    Given api "commu/record/search"
#    And param
#    """
#    pageIndex:
#    pageSize:
#    reciverName: ""
#    reciverPhone: ""
#    callerUserId: ""
#    dptIds: ""
#    schoolId: ""
#    voiceStatus: ""
#    channelType: ""
#    durationMin:
#    durationMax:
#    createdTimeStart: ""
#    createdTimeEnd: ""
#
#    """
#    And CookieX
#    | TOKEN | ${token} |
#    When get
#    Then JSONPATH_ASSERT "<resultCode>" equals "<code>"
#    Examples:
#      | resultCode | code   |
#      | result     | GB2001 |
#
#  Scenario Outline: with school Id
#    Given api "commu/record/search"
#    And param
#    """
#    pageIndex:
#    pageSize:
#    reciverName: ""
#    reciverPhone: ""
#    callerUserId: ""
#    dptIds: ""
#    schoolId: "SCHOOL20190411010000000019"
#    voiceStatus: ""
#    channelType: ""
#    durationMin:
#    durationMax:
#    createdTimeStart: ""
#    createdTimeEnd: ""
#
#    """
#    And CookieX
#      | TOKEN | ${token} |
#    When get
#    Then JSONPATH_ASSERT "<resultCode>" equals "<code>"
#    Examples:
#      | resultCode | code   |
#      | result     | GB2001 |
#
#  Scenario Outline: with school Id and start end time
#    Given api "commu/record/search"
#    And param
#    """
#    pageIndex:
#    pageSize:
#    reciverName: ""
#    reciverPhone: ""
#    callerUserId: ""
#    dptIds: ""
#    schoolId: "SCHOOL20190411010000000019"
#    voiceStatus: ""
#    channelType: ""
#    durationMin:
#    durationMax:
#    createdTimeStart: "2020-12-10"
#    createdTimeEnd: "2021-01-09"
#
#    """
#    And CookieX
#      | TOKEN | ${token} |
#    When get
#    Then JSONPATH_ASSERT "<resultCode>" equals "<code>"
#    Examples:
#      | resultCode | code   |
#      | result     | 000000 |