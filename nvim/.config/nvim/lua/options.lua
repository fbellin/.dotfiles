local globals = {



}

local options = {

  -- système
  swapfile = false,             -- désactivation du fichier de swap
  clipboard = "unnamedplus",    -- utilisation du presse-papier du système par défaut
  mouse = "a",
  undofile = true,              -- pas de limite à undo, même quand on rouvre un fichier

  -- apparence
  termguicolors = true,
  signcolumn = "yes:2",         -- affiche les signes avec une colonne en plus à gauche
  cursorline = true,            -- surligne la ligne active

  -- affichage des numéros de ligne
  relativenumber = true,
  number = true,                -- affiche le numéro absolu de la ligne active

  -- tabulations et indentation
  tabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  autoindent = true,
  numberwidth = 1,
  backspace = "indent,eol,start", -- on autorise l'utilisation de retour quand on indente, à la fin de ligne ou au début

  -- gestion des fenêtres
  splitright = true,              -- le split vertical s'affiche à droite
  splitbelow = true,              -- le split horizontal s'affiche en bas

  -- affichage des caractères spéciaux
  list = true,
  listchars = { trail = "•", precedes = "«", extends = "»", tab = "> " },

}

for k, v in pairs(globals) do
        vim.g[k] = v
end

for k, v in pairs(options) do
        vim.opt[k] = v
end
