*** Settings ***
Documentation        Suite de testes de cadastro de dog walker

Resource    ../resources/base.resource

Test Setup       Start session
Test Teardown    Finish session

*** Test Cases ***
Deve poder cadastrar um novo dog walker

    ${dog_walker}    Create Dictionary
    ...    name=Tamiris Silva
    ...    email=tamiressilva0954@gmail.com
    ...    cpf=00000014141
    ...    cep=44380970
    ...    number=1000
    ...    details=Apto 28
    ...    cnh=toretto.jpg
   
    Go to signup page
    Fill to signup form    ${dog_walker}
    Submit signup form
    Poupup should be    Recebemos o seu cadastro e em breve retornaremos o contato.


Não deve cadastrar se os campos obrigatórios não forem preenchidos
    [Tags]    required

    Go to signup page
    Submit signup form

    Alert should be    Informe o seu nome completo
    Alert should be    Informe o seu melhor email
    Alert should be    Informe o seu CPF
    Alert should be    Informe o seu CEP
    Alert should be    Informe um número maior que zero
    Alert should be    Adcione um documento com foto (RG ou CHN)


Não deve cadastrar se o CPF for incorreto
    [Tags]    cpf_inv

    ${dog_walker}    Create Dictionary
    ...    name=Tamiris Silva
    ...    email=tamiressilva0954@gmail.com
    ...    cpf=00000014141aa
    ...    cep=44380970
    ...    number=1000
    ...    details=Apto 28
    ...    cnh=toretto.jpg
   
    Go to signup page
    Fill to signup form    ${dog_walker}
    Submit signup form
    Alert should be    CPF inválido

Deve poder cadastrar um novo dog walker que sabe cuidar de pets
    [Tags]    aservice
    ${dog_walker}    Create Dictionary
    ...    name=Tamiris Silva
    ...    email=tamiressilva0954@gmail.com
    ...    cpf=00000014141
    ...    cep=44380970
    ...    number=1000
    ...    details=Apto 28
    ...    cnh=toretto.jpg
   
    Go to signup page
    Fill to signup form    ${dog_walker}
    Additional Service    Cuidar
    Submit signup form
    Poupup should be    Recebemos o seu cadastro e em breve retornaremos o contato.

Deve poder cadastrar um novo dog walker que sabe adestrar pets
    [Tags]    aservice
    ${dog_walker}    Create Dictionary
    ...    name=Tamiris Silva
    ...    email=tamiressilva0954@gmail.com
    ...    cpf=00000014141
    ...    cep=44380970
    ...    number=1000
    ...    details=Apto 28
    ...    cnh=toretto.jpg
   
    Go to signup page
    Fill to signup form    ${dog_walker}
    Additional Service    Adestrar
    Submit signup form
    Poupup should be    Recebemos o seu cadastro e em breve retornaremos o contato.