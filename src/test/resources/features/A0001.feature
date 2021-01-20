#Feature: user login
#  Scenario Outline: 获取图形验证码
#    Given api "http://192.168.10.102:7010/api/sc/captcha/captcha"
#    And param
#    """
#    scene: "uc_login"
#    """
#    When get
#    Then JSONPATH_ASSERT "<resultCode>" equals "<result>"
#    Then JSONPATH_GET_MONGO
#    | $.data | resultData |
#    Examples:
#    | resultCode | result |
#    | result     | 000000 |
#  Scenario Outline: 用户登录
#    Given api "http://192.168.10.102:7010/api/uc/login"
#    And param
#    """
#    userLoginpwd: "123456qqQQ"
#    captcha: ${resultData}
#    userMobile: ""
#    userLoginname: "YL015359"
#    verify: ""
#    userEmail: ""
#    """
#    When get
#    Then JSONPATH_ASSERT "<resultCode>" equals "<result>"
#    Then JSONPATH_GET_MONGO
#    | $.data.token | token |
#    Examples:
#    | resultCode | result |
#    | result     | 000000 |
