# Lojas conhecidas

O que já se sabe sobre a página de cupons de cada loja. Parte da skill [`cupons`](SKILL.md): consulte a linha da loja do link; loja ausente daqui segue a instrução geral do passo 2.

Cada entrada traz a data em que foi conferida. Página que mudou desde então: trate como loja ausente e avise na entrega.

## KaBuM! (`kabum.com.br`) — conferido em 22/11/2026

- **Página de cupons:** `kabum.com.br/hotsite/cupons`, o destino do item "Cupons" do menu. Lista código, desconto, validade, "Condições" de cada cupom e uma seção "Cupons Encerrados". Os cupons chegam por script, de uma planilha que a página carrega: a leitura simples devolve só as perguntas frequentes, então leia a página renderizada ou a planilha. Encerrado há mais de 7 dias some da página, e cupom com início no futuro aparece como "em breve".
- **Listagem de cada cupom:** o botão "Ver ofertas" leva a `kabum.com.br/promocao/<slug>` ou a um produto único. O slug nem sempre é o código (`CP1CASANINJA10` para `CASANINJA10`): use o link do botão. Quando o botão leva à página inicial (`TONOKABUM`) ou o código está ausente da página de cupons, tente `<código>`, `CP1<código>`, `CP3<código>` e `1P<código>` e leia toda variante que trouxer itens: mais de uma pode existir. A listagem pagina com `?page_number=N&page_size=100`, e o total de itens vem nos dados da página.
- **Listagem sobrevive ao cupom:** a `/promocao/<slug>` continua no ar depois que o cupom sai da página de cupons, e a do cupom "em breve" já existe antes do início. Ela mostra o que o cupom cobre; se ele está ativo, quem diz é a página de cupons. O card imprime o cupom do dia do produto, que pode ser outro (`ZAFADINHO13` nos cards da listagem do `ZAFADINHO10`).
- **Armadilhas:** `kabum.com.br/cupons` responde sem cupons, só com uma vitrine de lançamentos. Uma `/promocao/<slug>` inexistente responde sem erro e sem itens.
- **Página do produto:** o cupom do item aparece na frase "Use o cupom … neste item" e ao lado de "Inserir cupom". O preço à vista pode faltar no texto visível: está nos dados da página (`offers.price`).
- **Onde o cupom entra:** o campo de cupom aparece depois do login, fora do carrinho anônimo.
- **Preço:** o à vista é o do Pix; o parcelado é outro valor, maior. O card da listagem ignora a oferta em vigor: use o preço da página do produto.
- **Limite:** um cupom por compra.

## Amazon (`amazon.com.br`) — conferido em 22/11/2026

- **Página de cupons:** `amazon.com.br/cupons` cai numa página vazia. `amazon.com.br/coupons` leva a uma grade de cupons de ativar, sem código e sem busca por produto: anote como lida em parte.
- **Listagem de cada cupom:** `amazon.com.br/promotion/psp/<ID>` mostra título, validade com ano, termos e uma busca de itens qualificados. Chega-se a ela pelo link do cupom nos agregadores. A busca interna é imprecisa: procure pelo código do produto (ASIN) e registre quantos itens leu.
- **Cupom na página do produto:** é um botão de ativar, sem código.
- **O que decide:** a lista de itens qualificados de cada promoção, e não a categoria. O mesmo cupom aparece com códigos diferentes por agregador; a chave é o ID da promoção.
- **Categoria:** produtos irmãos ficam em árvores diferentes (um fone em "Instrumentos Musicais", outro em "Eletrônicos"); use a trilha da página do produto.
