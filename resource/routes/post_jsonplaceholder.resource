*** Settings ***
Library    json/post_jsonplaceholder.py
Resource   ../../base.resource

*** Keywords ***
POST Jsonplaceholder
    [Arguments]
    ...  ${person_first_name}
    ...  ${person_last_name}
    ...  ${phones}
    ...  ${expected_status}=201

    ${json}  Build Post Jsonplaceholder    ${person_first_name}    ${person_last_name}    ${phones}

    ${response_post}  POST On Session
    ...  alias=${SESSION_ALIAS}
    ...  url=/posts
    ...  json=${json}
    ...  expected_status=${expected_status}

    Set Test Variable    ${response_post}
    Create User Authorization Header
    RETURN  ${response_post.json()['user_id']}

Assert POST JSONPLACEHOLDER
    [Arguments]
    ...  ${first_name}
    ...  ${last_name}
    ...  ${phone_list}


    IF    ${response_post.status_code} == 200
        Should Be Equal As Strings    ${response_post.json()['person']['first_name']}    ${first_name}
        Should Be Equal As Strings    ${response_post.json()['person']['last_name']}    ${last_name}

        FOR    ${phone}    IN    @{phone_list}
            List Should Contain Value    ${response_post.json()['phones']}    ${phone}
        END
    END

Create User Authorization Header

    ${header}  Create Dictionary  Authorization=${response_post.json()['auth']['type']} ${response_post.json()['auth']['token']}

    Update Session    ${SESSION_ALIAS}
    ...  headers=${header}