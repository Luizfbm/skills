# skills

Skills para agentes de código, no formato [Agent Skills](https://agentskills.io/specification). Funcionam no Claude Code, no Codex, no Cursor e no app Claude.

*Agent skills in Brazilian Portuguese. The `cupons` skill finds discount coupons for Brazilian online stores only.*

## Se você é um agente

O usuário pediu para instalar uma skill daqui? Siga o [INSTALL.md](INSTALL.md) do começo ao fim. Ele traz os comandos de cada ambiente e uma verificação ao final de cada passo.

## Skills

| Skill | O que faz | O que você manda |
|---|---|---|
| [`cupons`](skills/cupons/SKILL.md) | Procura cupons de desconto para um produto e entrega só os que têm prova de que estão valendo | O link do produto numa loja brasileira |

## Instalar

O jeito mais simples é colar o endereço deste repositório no seu agente e pedir: "instala a skill `cupons` deste repositório". O agente segue o [INSTALL.md](INSTALL.md).

Para instalar à mão, os mesmos passos estão lá.

## Usar a `cupons`

| Agente | Comando |
|---|---|
| Claude Code | `/cupons https://loja.com.br/produto` |
| Cursor | `/cupons https://loja.com.br/produto` |
| Codex | `$cupons https://loja.com.br/produto` |
| App Claude | "Use a skill cupons neste link: https://loja.com.br/produto" |

Ela responde com uma tabela de cupons, cada um com um veredito e a prova:

- **Confirmado**: a própria loja liga o cupom àquele produto.
- **Provável**: a regra lida na loja cabe no produto e há dois sinais recentes, de fontes diferentes, de que o cupom está ativo.
- **Descartado**: todo o resto, com o motivo.

### O que ela não faz

- **Não testa o cupom no carrinho.** O veredito vem de evidências, e a resposta diz isso. O preço com cupom é uma estimativa.
- **Não faz login nem mexe em carrinho ou conta.**
- **Não compara lojas.** Procura cupons só da loja do link.
- **Não cobre lojas de fora do Brasil.**

### Precisa de quê

O agente precisa de acesso à web. Com navegador ou terminal ele lê todas as fontes; só com leitura simples de página, algumas fontes ficam lidas em parte e a busca sai mais pobre.

## Contribuir

Os endereços das lojas e dos sites de cupom mudam. O que mais ajuda:

- **Loja nova ou loja que mudou:** edite [`skills/cupons/LOJAS.md`](skills/cupons/LOJAS.md) com a página de cupons da loja, como chegar à listagem de cada cupom e a data em que você conferiu.
- **Fonte que mudou:** atualize a linha na tabela de fontes do [`SKILL.md`](skills/cupons/SKILL.md) e a data da coluna "Conferido em".

## Licença

[MIT](LICENSE).
