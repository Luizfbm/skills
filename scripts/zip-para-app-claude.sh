#!/usr/bin/env bash
# Gera o ZIP de uma skill para upload no app Claude (claude.ai e desktop).
# O app só aceita os campos padrão do Agent Skills no frontmatter, então a
# cópia sai sem `disable-model-invocation` e sem a pasta `agents/`.
#
# Uso: bash scripts/zip-para-app-claude.sh <nome-da-skill>
# Saída: dist/<nome-da-skill>.zip

set -euo pipefail

if [ $# -ne 1 ]; then
  echo "Uso: bash scripts/zip-para-app-claude.sh <nome-da-skill>" >&2
  exit 1
fi

nome="$1"
raiz="$(cd "$(dirname "$0")/.." && pwd)"
origem="$raiz/skills/$nome"

if [ ! -f "$origem/SKILL.md" ]; then
  echo "Skill não encontrada: $origem/SKILL.md" >&2
  exit 1
fi

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

cp -R "$origem" "$tmp/$nome"
rm -rf "$tmp/$nome/agents"

# Remove o campo só do frontmatter (o bloco entre a 1ª e a 2ª linha `---`).
awk '
  /^---[[:space:]]*$/ { fence++; print; next }
  fence == 1 && /^disable-model-invocation:/ { next }
  { print }
' "$origem/SKILL.md" > "$tmp/$nome/SKILL.md"

mkdir -p "$raiz/dist"
saida="$raiz/dist/$nome.zip"
rm -f "$saida"
(cd "$tmp" && zip -qr "$saida" "$nome" -x '*.DS_Store')

echo "$saida"
