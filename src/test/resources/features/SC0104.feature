#Feature: 图形验证码
#  Scenario Outline: 不传任何参数
#    Given api "sc/captcha/image"
#    When get
#    Then JSONPATH_ASSERT "<resultCode>" equals "<code>"
#    Examples:
#    | resultCode  | code |
#    | code        | 0000 |