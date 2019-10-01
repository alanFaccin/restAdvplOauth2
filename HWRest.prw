#include 'protheus.ch'
#include 'parmtype.ch'
#include 'RestFul.ch'

/*/{Protheus.doc} HelloWorld
//TODO Web service REST exemplo com autenticação Oauth2 JWT

Para funcionar a autenticação pelo OAuth 2.0 com JWT obrigatoriamente os endpoints devem entar dentro de  "api/protheus/" ou "api/framework/" e somente após isso deve conter o nome do servico/método

Exemplo:

- No appserver.ini configurações:

    [HTTPV11]
    Enable=1]
    Sockets=HTTPREST

    [HTTPREST]
    Port=8080
    IPsBind=
    URIs=HTTPURI
    ;Habilitar autenticação 
    Security=1 
    SSL2=1
    SSL3=1
    TLS1=1

    CERTIFICATE=C:\Totvs\meucertificado.crt
    KEY=C:\Totvs\meucertificado.key

    [HTTPURI]
    URL=/services
    PrepareIn=01,010001
    Instances=1,2                                      

    [Onstart]
    Jobs=HTTPJOB
    Refreshrate=120

    [HTTPJOB]
    Main=HTTP_START
    Environment=RESTST

- Exemplo para Obtenção do Token de autenticação passando user(MeuUser) e password(minhaSenha) como parametros (query params)
obs: mais informaçãoes na documentação https://tdn.totvs.com/pages/viewpage.action?pageId=465383509 
    https://meuserver:8080/services/api/oauth2/v1/token?grant_type=password&password=minhaSenha&username=MeuUser

- Exemplo requisição ao método ola definido abaixo:
    obs: No HEADER da requisição HTTP deve ser enviado o campo Authorization com o Token obtido pelo processo acima (mais informações em https://tdn.totvs.com/pages/viewpage.action?pageId=465383502)
    https://meuserver:8080/services/api/protheus/v1/HelloWorld/ola


@author alanjhones
@since 01/10/2019
@version 1.0
@type class
/*/
WSRESTFUL HelloWorld DESCRIPTION "HelloWorld"

    WSMETHOD GET ola DESCRIPTION "Método que retorna o Olá Mundo! " WSSYNTAX "/api/protheus/v1/HelloWorld/ola" PATH "/api/protheus/v1/HelloWorld/ola"

END WSRESTFUL

/*Método que retorna um Json com a mensagem Olá Mundo!*/
WSMETHOD GET ola WSRESTFUL HelloWorld

::SetContentType( APPLICATION_JSON )

/*Define o status de sucesso e o Json de retorno*/
::SetStatus(201)
::setResponse(FWJsonSerialize("Olá Mundo!",.F.,.T.))

return .T.

