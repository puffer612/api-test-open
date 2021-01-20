Feature:
  path： yaml 文件的名称
  info： 是这个yaml的表头
  这两个都是固定的
  Scenario Outline:
    Given api "https://umsauat.niceloo.com/api/"
    And yamlParam
    """
    path: test002.yml
    info: param
    """
    When getMore
    Then JSONPATH_ASSERT "<resultCode>" equals "<code>"
    Examples:
    | resultCode | code |
    | $.[0].result    | 000000 |
    | $.[0].api       | uc/user/loginway |
    | $.[1].result    | 000000 |
    | $.[2].result    | 0000001 |