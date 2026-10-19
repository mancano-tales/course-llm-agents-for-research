# Madrid Web

Tema Quarto que reproduz o Beamer Madrid na web (revealjs): barra de título azul, páginas de seção em caixa, rodapé em três blocos e as classes `.tese`, `.alerta`, `.fonte`, `.caixa`, `.camada`. O mesmo `.qmd` gera o PDF Beamer (`madrid-web-beamer`) e os slides web (`madrid-web-revealjs`).

## Instalar num projeto

```bash
quarto add mancano-tales/presentations --no-prompt
```

Copia `_extensions/madrid-web/` para o projeto (versione a pasta).

## Usar

```yaml
format:
  madrid-web-revealjs:
    footer: "Título curto da apresentação"
  madrid-web-beamer: default
```

Gerar: `quarto render slides.qmd` (as duas saídas) ou `--to madrid-web-revealjs`.

Para o rodapé à esquerda (padrão "DCP-USP 2026"), sobrescreva no próprio projeto:

```css
.reveal .footer::before { content: "Instituição 2026"; }
```

## Regras para o `.qmd` funcionar nos dois formatos

- Nada de LaTeX solto no corpo; estilos visuais vão em classes (`::: {.tese}`), tratadas pelo `madrid.lua` no PDF e pelo SCSS na web.
- Teste a web em 1280×720 ou maior; o revealjs escala o slide inteiro, então janelas pequenas só encolhem.
