return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    "hrsh7th/cmp-buffer",   -- source pour compléter le texte déjà présent dans le buffer
    "hrsh7th/cmp-path",     -- source pour compléter les chemins des fichiers
    "hrsh7th/cmp-cmdline",  -- source pour les completions de la cmdline de vim
    "hrsh7th/cmp-emoji",    -- complétion d'émojis à la saisie de :
  },
  config = function()
    local cmp = require("cmp")

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
     mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-1),
        ["<C-f>"] = cmp.mapping.scroll_docs(1),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accepte la sélection courante. Mettre à `false` pour ne confirmer que les items explicitement sélectionnés
      },

      -- sources pour l'autocompletion
      sources = cmp.config.sources({
        { name = "nvim_lsp" },  -- lsp
        { name = "nvim_lua" },
        { name = "buffer" },    -- texte du buffer courant
        { name = "path" },      -- chemins du système de fichier
        { name = "emoji" },     -- emojis
      }),

      formatting = {
        -- Comportement par défaut
        expandable_indicator = true,
        -- Champs affichés par défaut
        fields = { "abbr", "kind", "menu" },
     },
    })

    -- `/` complétion
    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    -- `:` complétion
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        {
          name = "cmdline",
          option = {
            ignore_cmds = { "Man", "!" },
          },
        },
      }),
    })

  end,
}

