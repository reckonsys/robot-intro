*** Test Cases ***

First Intro Bleh
    Log  foo


Second Intro Bleh
    sHOULD Be Equal    5    5    strip_spaces=True    msg=Foo
    ${my_dict}=    Create Dictionary   foo=bar   baz=car
    @{my_list}=    Create List    a    b    c
    Log Many   @{my_dict}
    Log    ${my_list}
    Log Many   @{my_list}
