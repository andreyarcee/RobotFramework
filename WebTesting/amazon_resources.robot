*** Settings ***
Library    SeleniumLibrary
Library    XML

*** Variables ***
${BROwSER}                    chrome
${URL}                        http://www.amazon.com.br
${MENU_ELETRONICOS}           //a[contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}         //h1[contains(.,'Eletrônicos e Tecnologia')]

*** Keywords ***
Abrir o navegador
    Open Browser    browser=${BROwSER} 
    Maximize Browser Window
#    ...             options=add_experimental_option("detach", True)
Fechar o navegador
    Capture Page Screenshot
    Close Browser
Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}
Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}
Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains    text=${FRASE}
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}
Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}
Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//img[contains(@alt,'${NOME_CATEGORIA}')]
Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox    text=${PRODUTO}
Clicar no botão de pesquisa
    Click Button    locator=nav-search-submit-button
Verificar o resultado da pesquisa, listando o produto o pesquisado
    Element Should Be Visible    locator=//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'Console Xbox Series S')]
Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"
Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"
Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa 
Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Verificar se o título da página fica "Amazon.com.br : Xbox Series S"     
E um produto da linha "Xbox Series S" deve ser mostrado na página 
    Verificar o resultado da pesquisa, listando o produto o pesquisado 
Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    Verificar o resultado da pesquisa, listando o produto o pesquisado
Adicionar o produto "Console Xbox Series S" no carrinho
    Click Image    locator=//img[contains(@alt,'Console Xbox Series S')]
    Click Button    locator=add-to-cart-button
Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Element Should Be Visible    locator=//h1[@class='a-size-medium-plus a-color-base sw-atc-text a-text-bold'][contains(.,'Adicionado ao carrinho')]
Remover o produto "Console Xbox Series S" do carrinho
    Click Element    locator=//a[contains(@data-csa-c-type,'button')]
    Click Element    locator=//input[contains(@value,'Excluir')]
Verificar se o carrinho fica vazio
    Wait Until Page Contains    text=Subtotal (0 produtos)