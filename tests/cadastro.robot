*** Settings ***

Resource    ${EXECDIR}/resources/base.robot


*** Test Cases ***
Deve cadastrar um novo usuário

    &{user}      Create Dictionary    
    ...    name=Juliana Souza    
    ...    email=juliana@hotmail.com    
    ...    password=pwd123

    Remove User By Email        ${user}[email]

    Start Session
    Go to signup
    Register user        ${user}
    Notice Should be    Boas vindas ao Mark85, o seu gerenciador de tarefas.

Usuário duplicado
    [Tags]    dup

   &{user}      Create Dictionary    
    ...    name=Jean Gray    
    ...    email=fenix@xmen.com    
    ...    password=pwd123
    
    Remove User By Email        ${user}[email]
    Start Session
    Go to signup
    Register user        ${user}
    Register user        ${user}
    Notice Should be    Oops! Já existe um cadastro com e-mail informado.

Nome deve ser obrigatório

    [Tags]    semnome

   &{user}      Create Dictionary    
    ...    name=    
    ...    email=juliana@hotmail.com    
    ...    password=pwd123

    Remove User By Email        ${user}[email]

    Start Session
    Go to signup
    Register user        ${user}
    Alert Should be    Informe seu nome completo
Email deve ser obrigatório

   [Tags]    sememail

   &{user}      Create Dictionary    
    ...    name=Juliana    
    ...    email= 
    ...    password=pwd123

    Remove User By Email        ${user}[email]

    Start Session
    Go to signup
    Register user        ${user}
    Alert Should be    Informe seu e-email

Senha deve ser obrigatória

   [Tags]    semsenha

   &{user}      Create Dictionary    
    ...    name=Juliana    
    ...    email=juliana@hotmail.com 
    ...    password=

    Remove User By Email        ${user}[email]

    Start Session
    Go to signup
    Register user        ${user}
    Alert Should be    Informe uma senha com pelo menos 6 digitos

Email deve ser valido

   [Tags]    invalidemail

   &{user}      Create Dictionary    
    ...    name=Juliana    
    ...    email=null    
    ...    password=pwd123

    Remove User By Email        ${user}[email]

    Start Session
    Go to signup
    Register user        ${user}
    Alert Should be    Digite um e-mail válido