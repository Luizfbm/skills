# Instalação (guia para agentes)

Você é um agente e o usuário pediu para instalar uma skill deste repositório. Siga os passos na ordem. Cada passo termina numa verificação: só avance quando ela passar.

As skills ficam em `skills/<nome>/`, no formato [Agent Skills](https://agentskills.io/specification): uma pasta com um `SKILL.md`. Nos comandos abaixo, troque `<nome>` pelo nome da skill pedida (por exemplo `cupons`). Se o usuário não disse qual, liste as pastas de `skills/` e pergunte.

## 1. Baixe o repositório

```bash
rm -rf /tmp/luizfbm-skills
git clone --depth 1 https://github.com/Luizfbm/skills.git /tmp/luizfbm-skills
```

Verificação: `test -f /tmp/luizfbm-skills/skills/<nome>/SKILL.md` retorna sucesso.

## 2. Descubra onde você roda

Instale para o agente que você é. Na dúvida, pergunte ao usuário em qual agente ele quer usar a skill.

| Você é | Siga |
|---|---|
| Claude Code | Passos 3 e 4 |
| Codex | Passo 3 |
| Cursor | Passo 3 |
| App Claude (claude.ai ou desktop, sem acesso a pastas de skills) | Passo 5 |
| Outro agente compatível com Agent Skills | Passo 6 |

## 3. Copie a skill para a pasta compartilhada

`~/.agents/skills/` é a pasta pessoal que Codex e Cursor leem direto.

Se `~/.agents/skills/<nome>` já existir, compare com `diff -r` e pergunte ao usuário antes de substituir.

```bash
mkdir -p ~/.agents/skills
cp -R /tmp/luizfbm-skills/skills/<nome> ~/.agents/skills/<nome>
```

Verificação: `test -f ~/.agents/skills/<nome>/SKILL.md` retorna sucesso.

Para instalar só num projeto, use `.agents/skills/<nome>` na raiz do projeto no lugar de `~/.agents/skills/<nome>`.

## 4. Claude Code: crie o link

O Claude Code lê `~/.claude/skills/`. O link aponta para a cópia do passo 3, assim as duas pastas nunca divergem.

```bash
mkdir -p ~/.claude/skills
ln -s ../../.agents/skills/<nome> ~/.claude/skills/<nome>
```

Verificação: `test -f ~/.claude/skills/<nome>/SKILL.md` retorna sucesso.

Num projeto, o link equivalente é `.claude/skills/<nome>` apontando para `../../.agents/skills/<nome>`.

## 5. App Claude: gere o ZIP

O app Claude instala skills por upload, e só o usuário faz o upload. Gere o arquivo:

```bash
bash /tmp/luizfbm-skills/scripts/zip-para-app-claude.sh <nome>
```

Verificação: o comando imprime o caminho de `dist/<nome>.zip` e `unzip -l` mostra `<nome>/SKILL.md` dentro dele.

Entregue o ZIP ao usuário e diga o passo que falta: abrir **Customize > Skills** no app Claude e enviar o arquivo. Sem terminal, peça ao usuário para rodar o comando acima no computador dele.

## 6. Outro agente

Copie `skills/<nome>/` para a pasta de skills pessoais que a documentação do seu agente indica. Se o seu agente recusar campos de frontmatter que não conhece, use a cópia gerada pelo passo 5, que traz só os campos padrão.

## 7. Conte ao usuário como usar

Diga ao usuário que a skill está instalada, que pode ser preciso abrir uma sessão nova para ela aparecer, e como chamá-la:

| Agente | Como chamar |
|---|---|
| Claude Code | `/<nome>` seguido do pedido |
| Cursor | `/<nome>` no chat do Agent |
| Codex | `$<nome>` seguido do pedido |
| App Claude | Peça pelo nome da skill na mensagem |

A tabela de skills do `README.md` diz o que mandar junto (a `cupons` espera o link de um produto).

## Alternativa: instalador `skills`

Quem tem Node pode usar `npx skills add Luizfbm/skills`. As opções mudam entre versões: confira com `npx skills --help` antes de rodar.

## Desinstalar

Apague `~/.agents/skills/<nome>` e o link `~/.claude/skills/<nome>`. No app Claude, remova a skill em Customize > Skills.
