#Feature: 图形验证码凭证
#  图形验证凭证
#  传参的问题
#  Scenario Outline: 	不传图形验证码场景
#    Given api "sc/captcha/token"
#    And param
#    """
#    captchaScene: ""
#    captchaType: "010001"
#    """
#    When get
#    Then JSONPATH_ASSERT "<resultCode>" equals "<code>"
#    Then JSONPATH_GET_MONGO
#    | data | returnData |
#    Examples:
#    | resultCode | code |
#    | code       | 0000 |
#
#  Scenario Outline: 	不传图形验证码场景
#    Given api "sc/captcha/token"
#    And param
#    """
#    captchaScene: ""
#    captchaType: "010001"
#    """
#    When get
#    Then JSONPATH_ASSERT "<resultCode>" equals "<code>"
#    Then JSONPATH_GET_MONGO
#      | data | returnData |
#    Examples:
#      | resultCode | code |
#      | code       | 0000 |