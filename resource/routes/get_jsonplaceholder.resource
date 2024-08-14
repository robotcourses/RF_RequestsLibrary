*** Settings ***
Resource    ../../base.resource

*** Keywords ***
GET Jsonplaceholder
    [Arguments]    
    ...    ${id}
    ...    ${expected_status}=200

    ${response_get}  GET On Session
    ...  alias=${SESSION_ALIAS}
    ...  url=/posts/${id}
    ...  expected_status=${expected_status}

    Set Test Variable    ${response_get}

Assert GET Jsonplaceholder
    [Arguments]
    ...  ${id}
    ...  ${user_id}

    IF  ${response_get.status_code} == 200
        Should Be Equal As Integers    ${response_get.json()["userId"]}    ${id}
        Should Be Equal As Integers    ${response_get.json()["id"]}    ${user_id}
    ELSE IF  ${response_get.status_code} == 404
        Should Be Empty  ${response_get.json()}
    END