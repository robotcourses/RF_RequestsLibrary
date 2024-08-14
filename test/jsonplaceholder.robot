*** Settings ***
Resource    ../base.resource

*** Test Cases ***
GET JSONPLACEHOLDER - 200

    GET Jsonplaceholder    id=3
    Assert GET Jsonplaceholder    id=1    user_id=3

GET JSONPLACEHOLDER - 404

    GET Jsonplaceholder    id=101  expected_status=404
    Assert GET Jsonplaceholder    id=1    user_id=101


POST JSONPLACEHOLDER

    ${phone_list}  Create List    21998776635  21987654567

    POST Jsonplaceholder    
    ...    person_first_name=Miguel    
    ...    person_last_name=Trindade
    ...    phones=${phone_list}
    
    Assert POST JSONPLACEHOLDER    
    ...    first_name=Miguel
    ...    last_name=Trindade
    ...    phone_list=${phone_list}

FLUXO INTEGRADO

    ${phone_list}  Create List    21998776635  21987654567

    ${user_id}  POST Jsonplaceholder    
    ...    person_first_name=Miguel    
    ...    person_last_name=Trindade
    ...    phones=${phone_list}

    GET Jsonplaceholder    id=${user_id}
