*** Settings ***
## Bibliotecas
Library    RequestsLibrary
Library    Collections

## Sessão
Resource  resource/session.resource

## Requisições
Resource    resource/routes/get_jsonplaceholder.resource
Resource    resource/routes/post_jsonplaceholder.resource

*** Variables ***
${URL_BASE}          https://jsonplaceholder.typicode.com/
${SESSION_ALIAS}     jsonplaceholder