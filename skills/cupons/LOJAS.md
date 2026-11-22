# Lojas conhecidas

O que já se sabe sobre a página de cupons de cada loja. Parte da skill [`cupons`](SKILL.md): consulte a linha da loja do link; loja ausente daqui segue a instrução geral do passo 2.

Cada entrada traz a data em que foi conferida. Página que mudou desde então: trate como loja ausente e avise na entrega.

## KaBuM! (`kabum.com.br`) — conferido em 22/11/2026

- **Página de cupons:** `kabum.com.br/hotsite/cupons`, o destino do item "Cupons" do menu. Lista código, desconto, "Condições" de cada cupom e uma seção "Cupons Encerrados".
- **Listagem de cada cupom:** o botão "Ver ofertas" leva a `kabum.com.br/promocao/<slug>` ou a um produto único. O slug nem sempre é o código (`CP1CASANINJA10` para `CASANINJA10`): use o link do botão.
- **Armadilhas:** `kabum.com.br/cupons` responde sem cupons, só com uma vitrine de lançamentos. Uma `/promocao/<slug>` inexistente responde com listagem vazia, sem erro.
- **Onde o cupom entra:** o campo de cupom aparece depois do login, fora do carrinho anônimo.
- **Preço:** o à vista é o do Pix; o parcelado é outro valor, maior.

## Amazon (`amazon.com.br`) — conferido em 22/11/2026

- **Página de cupons:** `amazon.com.br/cupons` cai numa página vazia. `amazon.com.br/coupons` leva a uma grade de cupons de ativar, sem código e sem busca por produto: anote como lida em parte.
- **Listagem de cada cupom:** `amazon.com.br/promotion/psp/<ID>` mostra título, validade com ano, termos e uma busca de itens qualificados. Chega-se a ela pelo link do cupom nos agregadores. A busca interna é imprecisa: procure pelo código do produto (ASIN) e registre quantos itens leu.
- **Cupom na página do produto:** é um botão de ativar, sem código.
- **O que decide:** a lista de itens qualificados de cada promoção, e não a categoria. O mesmo cupom aparece com códigos diferentes por agregador; a chave é o ID da promoção.
- **Categoria:** produtos irmãos ficam em árvores diferentes (um fone em "Instrumentos Musicais", outro em "Eletrônicos"); use a trilha da página do produto.
