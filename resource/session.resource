*** Settings ***
Resource    ../base.resource

*** Keywords ***
JSONPLACEHOLDER Session

    Create Session    
    ...    alias=${SESSION_ALIAS}    
    ...    url=${URL_BASE}
    ...    disable_warnings=${True}