#Feature: 心跳
#  测试一下心跳接口
#  Scenario Outline:  传参随机的json
#    Given api "sc/heartbeat"
#    And param
#    """
#    scene: {"timestamp": 1609230120438, "flag": "Q4S", "type": "push.heartbeat"}
#    """
#    When get
#    Then JSONPATH_ASSERT "<returnCode>" equals "<code>"
#    Examples:
#    | returnCode | code |
#    | code       | 0000 |
#
#  Scenario Outline:  不传参数
#    Given api "sc/heartbeat"
#    When get
#    Then JSONPATH_ASSERT "<returnCode>" equals "<code>"
#    Examples:
#      | returnCode | code |
#      | code       | 0000 |
#
#  Scenario Outline:  参数为字符串
#    Given api "sc/heartbeat"
#    And param
#    """
#    scene: "heart"
#    """
#    When get
#    Then JSONPATH_ASSERT "<returnCode>" equals "<code>"
#    Examples:
#      | returnCode | code |
#      | code       | 0000 |