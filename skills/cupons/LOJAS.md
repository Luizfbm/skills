# Lojas conhecidas

O que já se sabe sobre a página de cupons de cada loja. Parte da skill [`cupons`](SKILL.md): consulte a linha da loja do link; loja ausente daqui segue a instrução geral do passo 2.

Cada entrada traz a data em que foi conferida. Página que mudou desde então: trate como loja ausente e avise na entrega. A linha **Agregadores** traz o endereço de cada fonte quando ele foge do `<loja>` padrão.

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

- **Leitura:** `curl` sem cabeçalhos abre as páginas (os termos de promoção pedem `--compressed`); com cabeçalho de navegador cai numa verificação de robô, e o WebFetch devolve 503. A lista de itens de cada promoção só carrega no navegador.
- **Página de cupons:** `amazon.com.br/cupons` redireciona para uma página de departamentos, sem cupons. `amazon.com.br/coupons` redireciona, passando por `/deals?bubble-id=deals-collection-coupons`, para a vitrine do evento do momento (em novembro de 2026, `/blackfriday?bubble-id=deals-collection-coupons`); a primeira leitura às vezes dá 503 e a segunda abre. A vitrine traz um filtro "Cupons" e um carrossel "Cupons em destaque" que leva às promoções. Abra a promoção de cada item do carrossel e anote a página como lida em parte. No HTML, o rótulo de cada item fica antes do link e parece pertencer ao seguinte: vale o título da promoção.
- **Listagem de cada cupom:** `amazon.com.br/promotion/psp/<ID>` mostra título, validade com ano e termos. A lista de itens qualificados só aparece com script: a rolagem para em 48 itens, e o botão "Mostrar mais" carrega o resto. O "Sobre N itens" subestima o total: conte os itens lidos. Algumas pedem login para dizer quem se qualifica: marque "não verificado". Chega-se a ela pelo link do cupom nos agregadores. Um link de busca com lista de produtos (`s?rh=p_78:<ASINs>`) também é listagem; o destino que o Promobit dá para ele vem cortado em 1024 caracteres, então diga que a lista foi lida em parte.
- **Promoção sem listagem:** a segmentada (primeira compra, cartão, "R$ X off" sem tema) não tem lista de itens. Para ela, o que decide é a página do produto exibir o cupom. Os cupons do cartão Amazon e do Amazon Crédito param sempre no passo 5: o link leva a login, a página sem regra ou à página inicial.
- **Cupom na página do produto:** fica no bloco abaixo do preço, como botão de ativar ou como código em texto ("Insira o código X na finalização da compra"). O ID da promoção está em `amzn1.promotion.<ID>`, mas nem todo ID é cupom (o desconto do Pix e brindes também têm), e os termos completos estão no JSON `tncSectionContentMap` de `/promotion/details/popup/<ID>`. O bloco muda com o login: leia sem sessão. O HTML sem sessão traz também, escondido, "foi salvo na sua conta": vale o "Insira o código".
- **Encerrados:** não há lista. A promoção encerrada diz "A promoção foi encerrada"; a futura mostra o período.
- **O que decide:** a lista de itens qualificados de cada promoção, e não a categoria. O mesmo cupom aparece com códigos diferentes por agregador, e o mesmo código pode apontar para promoções diferentes: a chave é o ID da promoção.
- **Categoria:** produtos irmãos ficam em árvores diferentes (um fone em "Instrumentos Musicais", outro em "Eletrônicos"); use a trilha da página do produto.
- **Vendedor:** a oferta em destaque pode trocar entre leituras, da Amazon para um parceiro com envio Amazon. Anote o texto exato e compare com a exigência "vendido pela Amazon" das promoções.
- **Armadilha:** procure o código do produto (ASIN) só nos cards da promoção (`#productInfoList`), e conte ASINs distintos pelos links `/dp/`: os nós `[data-asin]` se repetem aninhados. O carrossel de vistos recentemente repete o produto aberto, e no navegador logado o carrinho lateral (`#ewc-compact-body`) também tem `data-asin`.
- **Preço:** o à vista é o do Pix ou NuPay, com desconto; o parcelado é o preço cheio. Sem sessão, a página pode esconder o preço ("adicione ao carrinho para ver"); o parcelado também aparece no bloco "Comprados juntos".
- **Agregadores:** Méliuz em `/desconto/cupom-desconto-amazon`, sem cashback. O Pelando tem `/cupons-de-descontos/amazon`.

## Mercado Livre (`mercadolivre.com.br`) — conferido em 22/11/2026

- **Leitura:** a leitura simples recebe 403 ou cai em `/gz/account-verification`. No navegador, a verificação às vezes libera sozinha em segundos e às vezes vira um reCAPTCHA (`/captcha/wall/...`) que não libera: nesse caso, loja bloqueou leitura. As páginas de afiliado para onde os agregadores mandam (`/ofertas/cuponomia`, `/ofertas/meliuz`, `/social/promobit`) caem em captcha: regra não lida na loja. Com sessão no navegador, a verificação aparece como `/captcha/wall/logged`.
- **Cupons genéricos:** os agregadores trazem dezenas de códigos de 22% a 30% em "produtos selecionados", com mínimo de R$ 1 e limite de usos: sem listagem, ficam fora da exceção de um sinal.
- **Página de cupons:** `mercadolivre.com.br/cupons`, o item "Cupons" do menu. Por categoria, em `/cupons/filter?all=true&ce_vertical=true&page=N` (30 por página), com os dados em `__NORDIC_RENDERING_CTX__`. Os termos de cada cupom ficam em `/cupons/api/terms?campaign_id=<id>&origin=filter`. Na página da loja, nenhum cupom tem código em texto; os agregadores listam códigos. As contagens do topo e do filtro não batem.
- **Listagem de cada cupom:** a lista de produtos de um cupom de campanha só aparece depois de "Aplicar", que ativa o cupom na conta. Cupom cuja regra cabe fica "não verificado". Os cupons de vendedor ("Em produtos de <apelido>") já vêm ativos.
- **Vendedor:** nos termos, "financiará produtos 1P" quer dizer só produtos vendidos pelo Mercado Livre, e "não se aplica a produtos 1P" quer dizer só parceiros. Full e loja oficial também restringem.
- **Catálogo:** uma página `/p/<id>` reúne várias ofertas, cada uma com trilha, vendedor e preço próprios. Vale a oferta do link (`pdp_filters=item_id:`); a lista de ofertas está em `/p/<id>/s`.
- **Canal:** os cupons valem nos apps.
- **Armadilhas:** "3C" é a marca de café 3 Corações. Termos às vezes citam outra campanha e outras datas: anote a divergência.
- **Agregadores:** `mercado-livre` em todas as fontes.

## Magazine Luiza (`magazineluiza.com.br`) — conferido em 22/11/2026

- **Leitura:** a loja devolve 403 à leitura simples e também ao navegador: loja bloqueou leitura. O endereço do produto traz a categoria: `/p/<id>/<categoria>/<subcategoria>/` (`ep/efso` é Eletroportáteis, Fritadeira Elétrica sem Óleo).
- **Página de cupons:** não existe. O cupom do item aparece na página do produto e em "Ver cupons" no pagamento, depois do login.
- **Listagem de cada cupom:** `magazineluiza.com.br/selecao/<slug>/`. O slug pode diferir do código (`b2b150eletro` para `150BFELETRO`); chega-se a ele pelo destino do cupom no Promobit. Com a loja bloqueada, esse destino fica sem abrir e o slug fica desconhecido. Cupom cujo link cai na página inicial não tem listagem pública.
- **Canais:** há cupons só do WhatsApp da loja e só do app.
- **Agregadores:** `magazine-luiza` no Cuponomia, no Promobit e no Méliuz; `magalu` no Pelando (`/cupons-de-descontos/magalu` existe). O cashback muda com o vendedor e a categoria (10% no Cuponomia para "vendido e entregue por Magalu", menos para parceiros). O Tecnoblog Achados mantém um post fixo de cupons do Magalu, que só abre no navegador. No Promobit, o valor mínimo de cada cupom vem no texto da regra (`couponInstructions`).

## Casas Bahia (`casasbahia.com.br`) — conferido em 22/11/2026

- **Leitura:** a leitura simples recebe 403; o navegador abre as páginas.
- **Página de cupons:** o item "Cupom" do menu, `casasbahia.com.br/c?Filtro=D77622`, é uma listagem de produtos. Os níveis de desconto estão nas imagens dos filtros rápidos "USE: <código>", listadas em `props.initialState.search.results.quickFilter` no `__NEXT_DATA__`; o nome do arquivo traz o percentual (`quick_filter_7.png` é "7% OFF"). Cada nível é um filtro `D9xxxx`. Não há validade nem lista de encerrados.
- **Achar o produto:** filtre a listagem pela categoria da trilha e pela marca na URL (`filtro=categoria-cX_cY&filtro=d77622&filtro=marca-mNNN`) e procure o código do item. Os números saem dos dados embutidos da página do produto (`categories[].id` e `brand.id`, dentro de `Product.product` no `__NEXT_DATA__`; o preço fica em `ProductPrice`). O filtro aceita a trilha de três níveis (`categoria-c73_c820_c76`). "Nenhum produto encontrado" com o filtro da categoria é "não cobre". A barra de filtros não mostra o do cupom: para provar que ele estava aplicado, compare com a mesma URL sem `d77622`. O selo do card é uma imagem com o texto alternativo "Cupom Black - N% - 1P/3P", e o percentual dele vale para o item: o do banner pode ser outro. Use um filtro de cupom por endereço: vários `filtro=dNNNNN` juntos se somam e dão "Nenhum produto encontrado", que não prova "não cobre". O filtro `d77622` (selo "3% 1P" em novembro de 2026) basta para a prova; os níveis `D96213`, `D96215`, `D96217` e `D96257` são os filtros rápidos "USE: BLACK".
- **Regras:** `/l/regras-regulamentos.aspx`, seção Cupom. O cupom não soma com o desconto do Pix; os de produtos da loja valem só para "vendido e entregue por Casas Bahia"; o de primeira compra é só no app, para cliente novo, e o código dele não aparece sem login. O Vale Bônus chega por e-mail e não é cupom publicado.
- **Preço:** o preço em destaque é o do Pix. O parcelado fica em "Ver mais opções de pagamento"; o número de parcelas sem juros muda por produto e por cartão.
- **Página do produto:** cards patrocinados de outros itens mostram o selo "Cupom Black": não é cupom exibido para o produto.
- **Cashback da loja:** até 9,9%, devolvido em cupom por e-mail que só vale no app, com teto de R$ 100 em compras acima de R$ 1.000.
- **Agregadores:** `casas-bahia`. A página do Cuponomia leva aos cupons e ao cashback da Casas Bahia dentro do Mercado Livre: descarte todos os cupons dela como de outra loja, sem abrir os botões. O Pelando não tem `/cupons-de-descontos/casas-bahia`; os cupons aparecem em `/busca/casas+bahia/lojas`, com o endereço da listagem (`sourceUrl`) nos dados.

## Livraria da Travessa (`travessa.com.br`) — conferido em 22/11/2026

- **Página de cupons:** não existe (menu, rodapé e busca não têm; `/cupons` dá 404). O "cupom-desconto" que aparece nas perguntas frequentes é reembolso, não promoção.
- **Página do produto:** preço em JSON-LD `offers.price`, com vírgula decimal, e trilha no `breadcrumb`. Preço único, em até 3x sem juros.
- **Promoções sem código:** `/wpgPrecoBanana.aspx?TipoArtigo=1&ofertas=S`. O "De" riscado só aparece no navegador; a leitura simples traz só o "Por" no JSON-LD. O Méliuz mostra uma oferta de "até 20%" sem código, que é o desconto já aplicado no preço.
- **Cupons pontuais:** às vezes um livro tem cupom próprio, citado na página dele (o SANKOFA, em novembro de 2026, valia só para outro livro). A busca `site:travessa.com.br cupom` acha esses; duas buscas bastam.
- **Agregadores:** Méliuz em `/desconto/livraria-da-travessa`, sem cashback e com "Cupons (0)". Cuponomia, Promobit e Pelando não têm a loja.
- **Armadilhas:** a loja oficial da Travessa no Mercado Livre é outra loja. O programa de pontos está suspenso.
- **Outras livrarias:** a Livraria Leitura recusa leitura simples (403), e a Livraria Cultura redireciona para uma página de erro 503.

## Alura (`alura.com.br`) — conferido em 22/11/2026

- **Página de cupons:** não existe. O cupom da campanha está nos dados da vitrine `alura.com.br/planos-cursos-online`, e o artigo `alura.com.br/artigos/cupom-alura` cita o código.
- **Dados:** a vitrine carrega o cupom por script. Uma das respostas de rede traz `codigo`, `desconto`, `dataInicial`, `expiracao`, `expirada`, `renovacao`, `pagina_de_promocao` e os preços com desconto de cada plano; todas são POST para a própria URL. A leitura simples traz o preço sem cupom, mas o preço com cupom vem como "Carregando".
- **Cookie de promoção:** abrir `/promocao/<código>` no navegador grava o cookie `alura-coupon`, e o botão de matrícula da vitrine (`/compra/<plano>/<código>`) passa a mostrar esse código, mesmo sem login. O cupom da campanha é o da resposta com `pagina_de_promocao: DEFAULT`. A página `/promocao/<código>` lida sozinha mostra o modelo da campanha sem código nem preço; a resposta com `codigo`, `expiracao` e os preços aparece ao abrir a vitrine depois dela, com o cookie gravado. Comece pelo `xadrezverbal`. O perfil do navegador pode já chegar com esse cookie, de outro uso: anote o valor que encontrou. As respostas de rede se leem pelo `requestId` delas.
- **Páginas de influenciador:** `alura.com.br/promocao/<código>`, com desconto próprio (em 22/11/2026, `xadrezverbal` dava 32% no anual, acima dos 30% da campanha). Acham-se pela busca `alura.com.br/promocao` e nos agregadores. Slug inexistente abre um conteúdo de página inicial, e a de cupom encerrado mostra "404" no corpo com HTTP 200: vale a página que mostra o código e o preço. O "até 52%" do título é o do plano de 2 anos, e a página pode mostrar só os planos de 2 anos, com o preço do anual apenas nos dados.
- **Preço:** a vitrine abre na aba "2 Anos"; o anual está em "1 Ano". O preço exibido já traz o cupom da campanha. Sem preço à vista separado. Nos dados, `plus` e `pro` são os planos anuais; `plus24` e `pro24`, os de 2 anos. Em novembro de 2026, `manualdomundo` dava 30%, igual à campanha.
- **Armadilha:** a leitura simples de `/planos`, `/cupons` e `/promocoes` às vezes fica pendurada por minutos: use tempo-limite.
- **Agregadores:** o Promobit não tem a loja; o Pelando não tem a página `/cupons-de-descontos/alura`. Os códigos `awin_*` do Cuponomia levam, pela Awin, a uma `/promocao/<código>` da loja.

## Hostinger (`hostinger.com.br`) — conferido em 22/11/2026

- **Endereço:** `hostinger.com.br` redireciona para `hostinger.com/br`. A empresa é de fora e vende em reais.
- **Página de cupons:** `hostinger.com/br/cupom`, fora do menu e do rodapé. Mostra o cupom já aplicado no card dos planos ("Cupom X aplicado"; o Single fica sem), sem validade nem condições. Os dados da página (`__NUXT_DATA__`) trazem o `coupon` de cada plano e período. Os botões "Usar cupom" não têm endereço, e o botão da página do plano vende sem cupom. É o único cupom da loja, e o preço do card (R$ 9,49/mês no Premium de 48 meses, em novembro de 2026) é menor que o da página do plano (R$ 9,99). O título da página ainda diz "2024".
- **Regras:** os códigos dos agregadores não têm página de regra; o link deles cai na página inicial ou num afiliado genérico. Um cupom por pedido.
- **Preço:** o JSON-LD traz só o preço mensal. O total do período e a renovação estão no texto da página e na resposta de rede `api-proxy/api/products/get-by-slugs`; o campo `coupon` só vem nos dados da `/br/cupom`. Texto e dados podem divergir no período de renovação: diga qual leu.
- **Agregadores:** as quatro fontes têm a loja: Cuponomia `/desconto/hostinger`, Promobit `/cupons/loja/hostinger/` (`storeDomain` `hostinger.com`), Méliuz `/desconto/cupom-hostinger` e Pelando `/busca/hostinger`. Os links dos códigos levam, por afiliado, à página inicial ou ao criador de sites.
