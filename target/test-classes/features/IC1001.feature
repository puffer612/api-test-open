#Feature: call
#  智能外呼 T:TQ;F:风云;C:CC外呼;P:手机外呼
#  Scenario Outline: call interface without token
#    Given api "icall/call"
#    And param
#    """
#    eeUserId: "USER20201112220000000053"
#    eeCallouttype: "C"
#    phoneNumber: "bkhpCAiQaPC+wwRjwfmZug=="
#    scene: "icall_call"
#    """
#    When get
#    Then JSONPATH_ASSERT "<resultCode>" equals "<code>"
#    Examples:
#      | resultCode | code   |
#      | result     | GB2004 |
#
#  Scenario Outline: call interface withOut scene
#    Given api "icall/call"
#    And param
#    """
#    eeUserId: "USER20201112220000000053"
#    eeCallouttype: "C"
#    phoneNumber: "bkhpCAiQaPC+wwRjwfmZug=="
#    scene: ""
#    """
#    And CookieX
#    | TOKEN | ${token} |
#    When get
#    Then JSONPATH_ASSERT "<resultCode>" equals "<code>"
#    Examples:
#    | resultCode  | code   |
#    | result      | GB1001 |
#
#  Scenario Outline: call interface with wrong scene
#    Given api "icall/call"
#    And param
#    """
#    eeUserId: "USER20201112220000000053"
#    eeCallouttype: "C"
#    phoneNumber: "bkhpCAiQaPC+wwRjwfmZug=="
#    scene: "xxxx"
#    """
#    And CookieX
#      | TOKEN | ${token} |
#    When get
#    Then JSONPATH_ASSERT "<resultCode>" equals "<code>"
#    Examples:
#      | resultCode  | code   |
#      | result      | GB1001 |
#
#  Scenario Outline: call interface withOut userId
#    Given api "icall/call"
#    And param
#    """
#    eeUserId: ""
#    eeCallouttype: "C"
#    phoneNumber: "bkhpCAiQaPC+wwRjwfmZug=="
#    scene: ""
#    """
#    And CookieX
#    | TOKEN | ${token} |
#    When get
#    Then JSONPATH_ASSERT "<resultCode>" equals "<code>"
#    Examples:
#    | resultCode | code    |
#    | result     | GB2001 |
#
#  Scenario Outline: call interface with wrong userId
#    Given api "icall/call"
#    And param
#    """
#    eeUserId: "0000XHWDFKJLKAKJGAGGFA"
#    eeCallouttype: "C"
#    phoneNumber: "bkhpCAiQaPC+wwRjwfmZug=="
#    scene: ""
#    """
#    And CookieX
#      | TOKEN | ${token} |
#    When get
#    Then JSONPATH_ASSERT "<resultCode>" equals "<code>"
#    Examples:
#      | resultCode | code    |
#      | result     | GB1001 |
#
#
#  Scenario Outline: call interface withOut calloutType
#    Given api "icall/call"
#    And param
#    """
#    eeUserId: "USER20201112220000000053"
#    eeCallouttype: ""
#    phoneNumber: "bkhpCAiQaPC+wwRjwfmZug=="
#    scene: ""
#    """
#    And CookieX
#      | TOKEN | ${token} |
#    When get
#    Then JSONPATH_ASSERT "<resultCode>" equals "<code>"
#    Examples:
#      | resultCode | code    |
#      | result     | GB2001 |
#
#  Scenario Outline: call interface with wrong calloutType
#    Given api "icall/call"
#    And param
#    """
#    eeUserId: "USER20201112220000000053"
#    eeCallouttype: "X"
#    phoneNumber: "bkhpCAiQaPC+wwRjwfmZug=="
#    scene: ""
#    """
#    And CookieX
#      | TOKEN | ${token} |
#    When get
#    Then JSONPATH_ASSERT "<resultCode>" equals "<code>"
#    Examples:
#      | resultCode | code    |
#      | result     | GB2001 |
#
#
#  Scenario Outline: call interface withOut phoneNumber
#    Given api "icall/call"
#    And param
#    """
#    eeUserId: "USER20201112220000000053"
#    eeCallouttype: "C"
#    phoneNumber: ""
#    scene: ""
#    """
#    And CookieX
#      | TOKEN | ${token} |
#    When get
#    Then JSONPATH_ASSERT "<resultCode>" equals "<code>"
#    Examples:
#      | resultCode | code    |
#      | result     | GB2001 |
#
#  Scenario Outline: call interface with wrong phoneNumber
#    Given api "icall/call"
#    And param
#    """
#    eeUserId: "USER20201112220000000053"
#    eeCallouttype: "C"
#    phoneNumber: "18310325608"
#    scene: ""
#    """
#    And CookieX
#      | TOKEN | ${token} |
#    When get
#    Then JSONPATH_ASSERT "<resultCode>" equals "<code>"
#    Examples:
#      | resultCode | code    |
#      | result     | GB1001 |
#
#  Scenario Outline: call interface with token
#    Given api "icall/call"
#    And param
#    """
#    eeUserId: "USER20201112220000000053"
#    eeCallouttype: "C"
#    phoneNumber: "bkhpCAiQaPC+wwRjwfmZug=="
#    scene: ""
#    """
#    And CookieX
#      | TOKEN | ${token} |
#    When get
#    Then JSONPATH_ASSERT "<resultCode>" equals "<code>"
#    Examples:
#      | resultCode | code   |
#      | result     | GB1001 |