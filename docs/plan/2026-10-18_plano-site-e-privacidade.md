# Plano: site do workshop, nome do repositório e material privado

Data: 2026-10-18. Status: proposta, aguardando decisões do autor.

## Diagnóstico

- **Repositório público** (`mancano-tales/2026-workshop-agentes-dcp-usp`), sem GitHub Pages.
- **Slides em três formatos concorrentes:**
  - `aulas/01-introducao-ecossistema/slides.qmd` e `aulas/02-habilidades-praticas/slides.qmd`: revealjs, saída HTML em `docs/aulas/*/slides.html` (já versionada).
  - `aulas/slides.qmd`: Beamer (Madrid) consolidado das duas sessões, saída `docs/aulas/slides.pdf` (não versionado).
  - `docs/aulas/02-habilidades-praticas/slides.pdf`: PDF avulso da sessão 2.
  - Render manual via `tools/render-slides.ps1`; `_quarto.yml` só cobre a ementa (typst/docx).
- **Material confidencial do Galdino** (`materiais-locais/manoel-galdino/`) está no `.gitignore` e **nunca foi commitado** (`git log --all -- materiais-locais` vazio). Não há vazamento no histórico. Há menções ao nome em arquivos públicos (autoria), o que é normal.
- `docs/` mistura saídas do Quarto (público) com governança interna (`plan/`, `pesquisa/`, `llm-reviews/`, `deprecated/`). Se o site publicar `docs/` inteiro, a governança vai junto.
- Há muitas mudanças não commitadas (migração `0-meta/` -> `docs/`, slides). Precisam ser commitadas antes de qualquer reestruturação.

## Decisões pedidas ao autor

1. **Nome.** Opções:
   - `workshop-agentes-ia` (curto, URL limpa: `mancano-tales.github.io/workshop-agentes-ia`) — **recomendado**.
   - `agentes-ia-pesquisa-social` (descritivo, sem data).
   - Manter o atual (data + evento ajudam no arquivo pessoal, mas a URL fica longa).
   O GitHub redireciona o nome antigo; basta atualizar o remoto local e links internos.
2. **Privado: submódulo vs. repo irmão.** Recomendo **repo privado irmão** (`workshop-agentes-ia-privado`) clonado dentro de `materiais-locais/` (já ignorado), **sem submódulo**. Submódulo expõe o nome/URL do repo privado no público e complica o clone de quem não tem acesso (CI do Pages falharia ao tentar baixar). Cada ministrante com acesso clona; o público não sabe que existe.
3. **Formato canônico dos slides.** Recomendo revealjs como "online first" (cada sessão uma página do site) e o Beamer consolidado como PDF para download/impressão, linkado no site.
4. **Quem tem acesso ao privado:** Galdino e Lamarca como colaboradores? (O autor decide e confirma com eles.)

## Etapas

### 1. Higiene (pré-requisito)
- Commitar as pendências atuais em commits temáticos (migração `0-meta` -> `docs`, slides, ferramentas).
- Checar segredos/dados pessoais nos arquivos públicos (varredura de `materiais-locais`, e-mails, tokens) antes de dar visibilidade com o site.

### 2. Material privado
- Criar repo privado; mover `materiais-locais/manoel-galdino/` para ele (clone em `materiais-locais/privado/`).
- Regra no `AGENTS.md`: nada de `materiais-locais/` vai para o repo público, nem citado no site; adaptações de material alheio exigem permissão do autor original.
- Opcional: hook `pre-commit` que recusa caminhos `materiais-locais/`.

### 3. Separar fonte do site e governança
- Converter o projeto Quarto em `type: website`, com fontes do site na raiz e saída em `_site/` (gerada pelo CI, não versionada).
- Deixar `docs/` só para governança (`plan/`, `pesquisa/`, `llm-reviews/`, `deprecated/`) e excluí-la do render. Isso exige ajustar a regra do `AGENTS.md` ("`docs/` recebe saídas do Quarto") e o `.gitignore` (`!docs/**/*.html`).
- Remover do versionamento os HTML/PDF compilados em `docs/aulas/` (passam a ser gerados no CI).

### 4. Estrutura do site
```
index.qmd               início: o workshop, ministrantes, data/local, como usar
ementa.qmd              ementa (já existe; mantém PDF/DOCX para download)
aulas/index.qmd         lista de sessões
aulas/01-.../slides.qmd revealjs embutido + link "tela cheia" e PDF
aulas/02-.../           slides, roteiro do lab, folha de saída
materiais.qmd           referências (referencias.md/.bib), ferramentas, links
sobre.qmd               ministrantes, licença, como citar
```
- Notas de aula (`notas-aula.md`): decidir se são públicas (material do aluno) ou ficam fora do site (roteiro do ministrante). Proposta: fora do site até revisão.
- Licença: CC BY 4.0 para conteúdo, MIT para código (decisão do autor e coministrantes).

### 5. Publicação
- Workflow `.github/workflows/publish.yml` com `quarto-dev/quarto-actions` (setup + render + publish em `gh-pages`), disparado por push na `main`. TinyTeX no CI para o Beamer, ou manter o PDF Beamer gerado localmente e anexado como release (mais simples).
- Ativar Pages na branch `gh-pages`; preencher `homepageUrl` do repo.

### 6. Entrega
- Issue de acompanhamento; branch + PR (mudança estrutural); revisão `@codex review`; merge.
- Verificação: site abre, slides navegam, PDF baixa, nenhum arquivo de `materiais-locais/` ou `docs/plan` aparece em `_site/`.

## Ordem sugerida
1 -> 2 (decisões 2 e 4) -> renomear (decisão 1) -> 3 -> 4 -> 5 -> 6.
