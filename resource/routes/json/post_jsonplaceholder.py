def build_post_jsonplaceholder(person_first_name: str, person_last_name: str, phones: list):

    return {
        "user_id": '1',
        "auth": {
            "type": "Bearer",
            "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c"
        },
        "person": {
            "first_name": person_first_name,
            "last_name": person_last_name
        },
        "phones": [
            p for p in phones
        ]
    }