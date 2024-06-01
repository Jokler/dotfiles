-- "highlight CocInlayHint ctermfg=238 guifg=#4b5263
-- "highlight DiagnosticUnderlineError cterm=italic,bold gui=italic,bold
-- "highlight LspDiagnosticsUnderlineError cterm=italic,bold gui=italic,bold

local illumination_bg = "#363a46"
return {
  {
    "navarasu/onedark.nvim",
    opts = {
      highlights = {
        IlluminatedWord = { bg = illumination_bg },
        IlluminatedCurWord = { bg = illumination_bg },
        IlluminatedWordText = { bg = illumination_bg },
        IlluminatedWordRead = { bg = illumination_bg },
        IlluminatedWordWrite = { bg = illumination_bg },
        SpellBad = { fg = "#e86671", fmt = "none" },
        --SpellBad       xxx ctermbg=9 gui=undercurl guisp=
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
