---
name: cupons
description: Encontra cupons de desconto com prova de que valem para o produto de um link de loja brasileira. Use quando o usuário enviar o link de um produto e pedir cupons.
disable-model-invocation: true
---

O link do produto está na mensagem do usuário. Encontre os cupons que valem hoje para esse produto, nessa loja. Todo cupom entregue carrega **prova**: a fonte, o sinal e a data que sustentam o veredito.

Pare e avise o usuário em três casos: mensagem sem link de produto (peça o link), loja de fora do Brasil (a skill cobre lojas brasileiras), sessão sem acesso à web (cupom de memória é cupom vencido).

Trabalhe só lendo: as páginas e os dados que elas carregam. Login, carrinho e conta ficam como estão; se a loja já abrir logada numa conta, use o que a página mostra e diga isso na entrega.

## Passos

1. **Produto.** Abra o link e anote: loja, nome, marca, a trilha de categorias inteira, vendedor (a própria loja ou um parceiro), preço à vista, preço parcelado, e todo cupom que a página exibir, com código ou como botão de ativar. Pronto quando cada campo tem valor ou "não exibido".
2. **Loja.** Ache a página de cupons da loja: pelo [`LOJAS.md`](LOJAS.md) se a loja estiver lá, senão pelo menu, rodapé ou busca do site. Liste os cupons ativos, os encerrados e os que ainda vão começar; código que aparece em mais de uma linha vale pela linha cujo período inclui hoje. Abra as condições e a listagem de produtos de todo cupom ativo cujo alvo é o produto, a categoria ou a marca dele, ou é genérico ("produtos selecionados", "todo o site"), e procure o produto nela. Pronto quando cada cupom ativo da loja está marcado: "cobre" (o produto está na listagem), "não cobre" (listagem lida sem o produto, cupom que aponta para outro produto, ou condição que exclui o produto) ou "sem relação" (o título nomeia outra categoria ou marca).
3. **Agregadores.** Leia toda fonte da tabela [Fontes](#fontes) e liste cada cupom que ela traz para a loja, com os sinais ao lado. Pronto quando toda fonte está lida, lida em parte ou anotada como inacessível.
4. **Triagem.** Mande direto para o passo 5 o candidato anunciado como "todo o site" ou para a categoria do produto. Dos demais, descarte sem abrir regras o que cai em um destes: encerrado, vencido ou ainda por começar na loja; validade vencida; de outra loja; título de categoria ou marca sem relação com o produto; rótulo sem código vindo de agregador ("ative no link", "cupom no link"); fora da loja e com menos de dois **sinais frescos**. Pronto quando cada candidato está descartado com o motivo ou segue para o passo 5.
5. **Regras.** Para cada candidato que sobrou, leia a regra na loja: siga o link do cupom no agregador até a página da promoção, ou ache-a pela página de cupons da loja. Compare com o produto: listagem de itens, categoria e marca, vendedor, valor mínimo, forma de pagamento, canal (app ou site), primeira compra, assinatura, cartão exigido. Pronto quando cada um está marcado "cabe", "cabe sob condição" ou "não cabe", com a página que mostrou isso.
6. **Veredito.** Dê a cada candidato um dos três [vereditos](#vereditos), com a prova escrita. Pronto quando todo candidato tem veredito e prova.
7. **Entrega.** Responda no formato de [Entrega](#entrega).

## Vereditos

- **Confirmado**: a própria loja liga hoje o cupom a este produto. Vale o cupom na página do produto, no card dele numa listagem, ou na página de cupons da loja apontando para uma listagem que contém o produto.
- **Provável**: a regra lida na loja cabe no produto e há dois sinais frescos vindos de fontes diferentes.
- **Descartado**: todo o resto.

A loja prevalece sobre o agregador, para confirmar e para descartar: cupom que a loja dá como encerrado está descartado, mesmo com selo de "usado hoje" em outro site.

Um **sinal fresco** é um destes, lido hoje:

- validade escrita com dia, mês e ano, ainda por vencer;
- cupom publicado ou verificado no agregador há até 7 dias;
- contagem de uso no dia ("N usados hoje");
- matéria ou post de até 7 dias que cita o cupom;
- comentário de até 7 dias relatando que o cupom funcionou.

Cada fonte conta como um sinal, por mais selos que mostre. Data de atualização da página inteira fica fora da conta.

A prova de "não cabe" por listagem é a contagem: "produto ausente, N itens lidos de M".

## Fontes

O `<loja>` é o nome da loja em minúsculas (`kabum`, `amazon`). Endereço que falha ou redireciona para uma página vazia: ache a página da loja pela busca do próprio agregador; sem sucesso, anote a fonte como inacessível e siga.

| Fonte | Como chegar | O que ela mostra | Conferido em |
|---|---|---|---|
| Cuponomia | `cuponomia.com.br/desconto/<loja>` | Código em texto, "Verificado N dias atrás", "N usados hoje", lista de expirados. O botão do cupom leva à página da promoção na loja | 22/11/2026 |
| Promobit | `promobit.com.br/cupons/loja/<loja>/` | Nos dados embutidos da página (JSON `__NEXT_DATA__`): `couponCode`, `couponUntil` (validade com ano), `couponPublished`, `couponVerified`, `storeDomain`. Cupons presos a uma oferta de produto ficam em outro bloco, `offerCoupon` dentro das ofertas. O texto visível omite o ano e esconde o código; quem só alcança o texto visível anota "lida em parte". A lista traz cupons de outras lojas: filtre por `storeDomain` | 22/11/2026 |
| Méliuz | `meliuz.com.br/desconto/cupom-<loja>` | Código em texto e uma regra resumida. Muitos itens são rótulos sem código | 22/11/2026 |
| Pelando | `pelando.com.br/cupons-de-descontos/<loja>`, que existe só para parte das lojas; nas demais, busca `site:pelando.com.br cupom <loja>` | Posts com data relativa, marca de expirado e comentários dizendo se funcionou | 22/11/2026 |
| Achados | Busca `cupom <produto> <loja> <mês> <ano>` (Tecnoblog Achados, TecMundo) | Matéria datada com o cupom e o preço; "Oferta encerrada" quando acabou. O Tecnoblog recusa leitura simples de página | 22/11/2026 |

Cuponomia e Méliuz mostram também o cashback da loja: anote o maior que vale sem assinatura do agregador.

## Entrega

1. Uma linha com produto, loja, preço à vista e preço parcelado. Se a página estava logada numa conta, diga que preço e condições são dessa conta.
2. Tabela dos **confirmados** e **prováveis**, confirmados primeiro, com as colunas: Cupom (o código, ou "ativar na página"), Desconto, Preço estimado, Veredito, Prova (a fonte, o que ela mostra e a data da leitura), Condição.
3. Uma linha com o maior cashback encontrado e a fonte.
4. **Descartados**, agrupados por motivo. Liste um a um os que alguém esperaria que valessem: os do mesmo produto ou categoria, os de "todo o site" e os de primeira compra, incluídos os que a loja encerrou e os que ainda vão começar, com a data de início. Resuma os demais em uma linha com a contagem.
5. Feche com: "Nenhum cupom foi testado no carrinho; os vereditos vêm das provas citadas."

O **preço estimado** é conta sua sobre o preço à vista e o parcelado. Quando a ordem entre o cupom e o desconto à vista é desconhecida, dê a faixa. Diga quando não se sabe se o cupom acumula com a oferta em vigor.

Sem nenhum confirmado ou provável, diga isso logo após a linha do produto e siga com os itens 3 a 5.
