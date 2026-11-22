# skills

Skills para agentes de código, no formato [Agent Skills](https://agentskills.io/specification). Funcionam no Claude Code, no Codex, no Cursor e no app Claude.

*Agent skills in Brazilian Portuguese. The `cupons` skill finds discount coupons for Brazilian online stores only.*

O repositório está em desenvolvimento: as skills mudam a cada rodada de testes. Use a versão mais recente e, se algo não funcionar, abra uma issue.

## Se você é um agente

O usuário pediu para instalar uma skill daqui? Siga o [INSTALL.md](INSTALL.md) do começo ao fim. Ele traz os comandos de cada ambiente e uma verificação ao final de cada passo.

## Skills

| Skill | O que faz | O que você manda |
|---|---|---|
| [`cupons`](skills/cupons/SKILL.md) | Procura cupons de desconto para um produto e entrega só os que têm prova de que estão valendo | O link do produto numa loja brasileira |

## Instalar

O jeito mais simples é colar o endereço deste repositório no seu agente e pedir: "instala a skill `cupons` deste repositório". O agente segue o [INSTALL.md](INSTALL.md).

Com Node, um comando instala para Claude Code, Codex e Cursor:

```bash
npx skills add Luizfbm/skills --skill cupons -g -a claude-code codex cursor -y
```

Para instalar à mão, os passos estão no [INSTALL.md](INSTALL.md).

## Usar a `cupons`

| Agente | Comando |
|---|---|
| Claude Code | `/cupons https://loja.com.br/produto` |
| Cursor | `/cupons https://loja.com.br/produto` |
| Codex | `$cupons https://loja.com.br/produto` |
| App Claude | "Use a skill cupons neste link: https://loja.com.br/produto" |

Junto do link dá para dizer a variação que interessa, como "plano Premium de 48 meses" ou "voltagem 220V".

A resposta traz o preço do produto e os cupons, cada um com um veredito e a prova:

- **Confirmado**: a própria loja liga o cupom àquele produto.
- **Provável**: a regra lida na loja cabe no produto e há dois sinais recentes, de fontes diferentes, de que o cupom está ativo.
- **Não verificado**: o cupom passou pela triagem, mas a loja ou o site de cupons não deixou ler a regra (página bloqueada, regra só com login, loja que não publica regra). Vem com os sinais que existem e, quando dá, com o preço estimado.
- **Descartado**: todo o resto, agrupado pelo motivo.

Também diz o maior cashback disponível e lista, sem ler, os sites de cupom que não estão entre as fontes da skill.

### O que ela não faz

- **Não testa o cupom no carrinho.** O veredito vem de evidências, e a resposta diz isso. O preço com cupom é uma estimativa.
- **Não faz login, não mexe em carrinho ou conta e não ativa cupom.**
- **Não contorna bloqueio.** Se a loja barra a leitura, a skill diz isso e segue com o que os sites de cupom mostram.
- **Não compara lojas.** Procura cupons só da loja do link.
- **Não cobre lojas que não vendem em reais.**

### Lojas com instruções próprias

O [`LOJAS.md`](skills/cupons/LOJAS.md) guarda o que já se sabe de cada loja: onde fica a página de cupons, como achar a listagem de cada cupom e as armadilhas. Hoje cobre KaBuM!, Amazon, Mercado Livre, Magazine Luiza, Casas Bahia, Livraria da Travessa, Alura e Hostinger. Outras lojas funcionam pela instrução geral da skill.

### Precisa de quê

O agente precisa de acesso à web. Com navegador ou terminal ele lê todas as fontes; só com leitura simples de página, algumas ficam lidas em parte e a busca sai mais pobre.

## Contribuir

Os endereços das lojas e dos sites de cupom mudam. O que mais ajuda:

- **Loja nova ou loja que mudou:** edite [`skills/cupons/LOJAS.md`](skills/cupons/LOJAS.md) com a página de cupons da loja, como chegar à listagem de cada cupom e a data em que você conferiu.
- **Fonte que mudou:** atualize a linha na tabela de fontes do [`SKILL.md`](skills/cupons/SKILL.md) e a data da coluna "Conferido em".
- **Resultado errado:** abra uma issue com o link do produto, a data e o que a skill respondeu.

## Licença

[MIT](LICENSE).
