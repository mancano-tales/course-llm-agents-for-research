-- Hierarquia tipográfica dos destaques no PDF; o conteúdo permanece no QMD.
function Div(el)
  if not FORMAT:match('beamer') then return nil end
  local before
  if el.classes:includes('fonte') then
    before = '\\begingroup\\scriptsize\\color{gray}'
  elseif el.classes:includes('alerta') then
    before = '\\begingroup\\usebeamercolor[fg]{alerted text}'
  elseif el.classes:includes('tese') then
    before = '\\begingroup\\usebeamercolor[fg]{structure}\\bfseries'
  end
  if before then
    local result = {pandoc.RawBlock('latex', before)}
    for _, block in ipairs(el.content) do result[#result + 1] = block end
    result[#result + 1] = pandoc.RawBlock('latex', '\\endgroup')
    return result
  end
end
