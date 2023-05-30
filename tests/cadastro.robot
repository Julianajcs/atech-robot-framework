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

#Nome deve ser obrigatório
   
#Email deve ser obrigatório

#Senha deve ser obrigatória
