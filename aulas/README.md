# Apresentação única do minicurso

A fonte principal é `slides.qmd`, com as duas sessões e um bloco de aprofundamento. O PDF usa o template nativo **Beamer Madrid**, em 16:9. `madrid-header.tex` configura identificação e numeração; `madrid.lua` diferencia referências e destaques.

Na raiz do repositório, execute:

```powershell
pwsh -File tools/render-slides.ps1
```

Requer PowerShell 7, Quarto e LaTeX com XeLaTeX (por exemplo, TinyTeX). As fontes usadas são Arial e Consolas. O script compila o PDF com Beamer. A saída é copiada para `assets/agentes-ia-pesquisa.pdf`, publicada no site.

O modo `handout` consolida os incrementos no PDF, mantendo uma página por frame. O PDF não depende de impressão do navegador.

## Organização pedagógica

A Sessão 1 preserva o panorama conceitual. A Sessão 2 aprofunda o desenho de workflows: contrato da tarefa, criação de skills, esquema de saída, rubrica, revisão e limite de rodadas, cobertura das fontes e avaliação do ganho.

GitHub é o ambiente de colaboração apresentado: issues registram escopo e decisões; branches e PRs organizam propostas; checks e regras configuradas sustentam a revisão. As definições e funcionalidades são apoiadas em links da documentação oficial nos slides. Os exemplos são didáticos; não configuram proteções nem criam issues e PRs reais.

O cronograma da Sessão 2 soma 90 minutos. Os três slides de conteúdo após a abertura de aprofundamento ficam para consulta ou extensão: passagem de contexto, distribuição dos registros e produção de relatórios. Priorizar um exemplo do auditor, uma execução do validador e um bloqueio; a parte de GitHub usa um PR existente para evitar outra execução demorada.

Os roteiros separados continuam nas pastas das sessões. As notas do QMD detalham as novas discussões, a distinção entre exemplo e funcionalidade implementada e as limitações das verificações.

O material confidencial de referência permanece local e ignorado pelo Git. O conteúdo da apresentação foi adaptado ao projeto didático de discursos fictícios.
