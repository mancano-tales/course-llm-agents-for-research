# Workshop Agentes: Inteligência Artificial e Autonomia na Pesquisa Social

**Site:** <https://mancano-tales.github.io/agentic-research-workshop/> (slides, ementa e materiais).

Repositório oficial de materiais, ementa, apresentações e tutoriais práticos do minicurso oferecido no **Seminário Discente DCP-USP 2026**.

## Ministrantes
* **Manoel Galdino** ([@mgaldino](https://github.com/mgaldino)) — Professor no Departamento de Ciência Política da USP
* **Felipe Lamarca** ([@felipelmc](https://github.com/felipelmc)) — Mestrando em Ciência Política no IESP-UERJ
* **Tales Mançano** ([@mancano-tales](https://github.com/mancano-tales)) — Mestrando em Ciência Política no DCP-USP

---

## Estrutura do Minicurso (2 Sessões de 1h30)

| Sessão | Tema Principal | Tópicos Centrais |
|---|---|---|
| **Sessão 1** | Do Chatbot ao Agente | LLMs como agentes (terminal, arquivos), panorama de modelos, prosa vs. instruções determinísticas, containerização — sem prática |
| **Sessão 2** | Habilidades Práticas | Hooks de agente (*code as policy*, analogia com git hooks — sem exigir git prévio), skills e orquestração/gerenciamento de contexto, MCP, `AGENTS.md`, boas aplicações exemplares de IA para pesquisa |

---

## Documentos e Materiais

* **Ementa Completa**: Consulte a versão em código em [2026-workshop-agentes-dcp-usp-ementa.qmd](2026-workshop-agentes-dcp-usp-ementa.qmd), a versão compilada (HTML, PDF e DOCX) no site.
* **Plano Geral das Aulas**: [docs/plan/plano-geral.md](docs/plan/plano-geral.md) — fio condutor, casos-âncora, cronograma, divisão de papéis e checklist de preparação.
* **Plano de Preparação (out. 2026)**: [docs/plan/2026-10-06_plano-preparacao-aulas.md](docs/plan/2026-10-06_plano-preparacao-aulas.md) — síntese da pesquisa exploratória, decisões propostas e pauta da reunião dos ministrantes.
* **Pesquisa Exploratória**: [docs/pesquisa/](docs/pesquisa/) — panorama de cursos sobre agentes, *code as policy*, modelos e *harnesses*, e o que Scott Cunningham tem publicado.
* **Slides** (Quarto Beamer Madrid): apresentação única das duas sessões em [aulas/slides.qmd](aulas/slides.qmd), com versão em [PDF](assets/agentes-ia-pesquisa.pdf). Os marcadores “Sessão 1” e “Sessão 2” delimitam as aulas dentro do mesmo material. As versões anteriores separadas permanecem nas pastas de cada sessão; edite o arquivo único para atualizar a apresentação do curso.
* **Roteiros do Instrutor**:
  * [Sessão 1: Introdução aos Agentes](aulas/01-introducao-ecossistema/notas-aula.md)
  * [Sessão 2: Habilidades Práticas e Governança](aulas/02-habilidades-praticas/notas-aula.md)
* **Projeto de Demonstração (Sessão 2)**: [aulas/02-habilidades-praticas/lab/projeto-demo/](aulas/02-habilidades-praticas/lab/projeto-demo/) — *skill*, *hooks* em R, subagente auditor e `AGENTS.md` aplicados à codificação de discursos parlamentares fictícios.
* **Bibliografia Comentada**: [referencias.md](referencias.md) ([BibTeX](referencias.bib)).

---

## Como Compilar os Materiais Localmente

Este projeto utiliza [Quarto](https://quarto.org) para renderização de documentos e apresentações:

```bash
# Site completo em _site/ (o mesmo que o GitHub Actions publica)
quarto render
quarto preview
```

```bash
# Ementa em PDF (Typst) e DOCX, dentro de _site/
quarto render 2026-workshop-agentes-dcp-usp-ementa.qmd --to typst
quarto render 2026-workshop-agentes-dcp-usp-ementa.qmd --to docx
```

```powershell
# PDF Beamer Madrid das duas sessoes (PowerShell 7, Quarto e XeLaTeX); copia para assets/
pwsh -File tools/render-slides.ps1
```

O site é publicado automaticamente no GitHub Pages a cada push na `main` (`.github/workflows/publish.yml`). O PDF Beamer não é gerado no CI: renderize localmente e versione `assets/agentes-ia-pesquisa.pdf`.

## Licença

Conteúdo sob CC BY 4.0; código sob MIT. Ver [LICENSE.md](LICENSE.md).
