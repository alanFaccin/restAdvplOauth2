#include 'protheus.ch'
#include 'parmtype.ch'
#include 'RestFul.ch'

/*/{Protheus.doc} HelloWorld
//TODO Web service REST exemplo com autentica��o Oauth2 JWT

Para funcionar a autentica��o pelo OAuth 2.0 com JWT obrigatoriamente os endpoints devem entar dentro de  "api/protheus/" ou "api/framework/" e somente ap�s isso deve conter o nome do servico/m�todo

Exemplo:

- No appserver.ini configura��es:

    [HTTPV11]
    Enable=1]
    Sockets=HTTPREST

    [HTTPREST]
    Port=8080
    IPsBind=
    URIs=HTTPURI
    ;Habilitar autentica��o 
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

- Exemplo para Obten��o do Token de autentica��o passando user(MeuUser) e password(minhaSenha) como parametros (query params)
obs: mais informa��oes na documenta��o https://tdn.totvs.com/pages/viewpage.action?pageId=465383509 
    https://meuserver:8080/services/api/oauth2/v1/token?grant_type=password&password=minhaSenha&username=MeuUser

- Exemplo requisi��o ao m�todo ola definido abaixo:
    obs: No HEADER da requisi��o HTTP deve ser enviado o campo Authorization com o Token obtido pelo processo acima (mais informa��es em https://tdn.totvs.com/pages/viewpage.action?pageId=465383502)
    https://meuserver:8080/services/api/protheus/v1/HelloWorld/ola


@author alanjhones
@since 01/10/2019
@version 1.0
@type class
/*/
WSRESTFUL HelloWorld DESCRIPTION "HelloWorld"

    WSMETHOD GET ola DESCRIPTION "M�todo que retorna o Ol� Mundo! " WSSYNTAX "/api/protheus/v1/HelloWorld/ola" PATH "/api/protheus/v1/HelloWorld/ola"

END WSRESTFUL

/*M�todo que retorna um Json com a mensagem Ol� Mundo!*/
WSMETHOD GET ola WSRESTFUL HelloWorld

::SetContentType( APPLICATION_JSON )

/*Define o status de sucesso e o Json de retorno*/
::SetStatus(201)
::setResponse(FWJsonSerialize("Ol� Mundo!",.F.,.T.))

return .T.

