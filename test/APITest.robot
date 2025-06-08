*** Settings ***
Library       Collections
Library       RequestsLibrary

*** Variables ***
${base_url}         https://rahulshettyacademy.com
#${book_id}          947303324534
${book_name}        RobotFrameworkac

*** Test Cases ***
Play around with Dictinoary
    [Tags]      API
    &{data}=    Create Dictionary      name=rahulshetty     course=robot       website=rahulshettyacademy.com
    log     ${data}
    Dictionary Should Contain Key     ${data}     name
    log     ${data}[name]
    ${url}=     Get From Dictionary     ${data}     website
    log   ${url}

Add Book into Library DataBase
        [Tags]      API
      &{req_body}=  Create Dictionary    name=${book_name}        isbn=947303     aisle=324534        author=rahulshetty
       ${response}=     POST        ${base_url}/Library/Addbook.php     json=${req_body}    expected_status=200
        log      ${response.json()}
        Dictionary Should Contain Key     ${response.json()}     ID

         Should be equal as Strings     successfully added      ${response.json()}[Msg]
         status should be       200     ${response}

Get the book details added
    ${Params}=     Create Dictionary   name=Vishal
    ${get_response}=    GET     ${base_url}/Library/GetBook.php     params=${Params}      expected_status=200
    Dictionary Should Contain Key    ${get_response}    aisle=3452

Add new book
    ${new_json}=    Create Dictionary   name=Avinash    isbn=435875  aisle=4552     author=Avinash
    ${new_response}=    POST    ${base_url}/Library/Addbook.php    json=${new_json}  expected_status=200
Add Python
    ${py_json}=     Create Dictionary   name=Vishal     isbn=445268     aisle=3452  author=para
    ${py_response}=     POST     ${base_url}/Library/Addbook.php      json= ${py_json}    expected_status=200