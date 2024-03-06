local M = {}
M.ui = {
  theme = "catppuccin",
  nvdash = {
    load_on_startup = true,

    header = {
      "▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
      "▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░  ░░░░░░░░░░░░░░░░░░░░░░░░░░  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
      "▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░  ░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
      "▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
      "▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░  ░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
      "▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    ░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
      "▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    ░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░  ░░░░░░░░░░░░░░░░░░░░░░░░░░",
      "▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░    ░░░░░░░░░░░░░░░░▒▒▒▒▓▓▓▓██▓▓██████████████████▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░  ░░▒▒░░░░░░░░░░░░░░░░░░░░",
      "▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░    ░░░░░░░░░░░░▒▒▓▓▓▓██████████████████████████████████████▓▓▒▒▒▒▒▒▒▒▒▒░░░░  ░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒",
      "▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    ░░░░░░░░░░░░▓▓▓▓██████████████████████████████████████████████▓▓▒▒▒▒▒▒░░░░░░  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒",
      "▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░    ░░░░░░░░▒▒▓▓████████████████████████████████████████████████████▓▓▒▒▒▒▒▒░░░░░░  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒",
      "▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░    ░░░░░░░░▓▓████████████████████████████████████████████████████████▓▓▒▒▒▒░░░░░░  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒",
      "▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░    ░░░░░░░░▒▒▓▓██████████████████████████████████████████████████████████▒▒▒▒░░░░░░  ░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒",
      "▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░    ░░░░  ░░▓▓████████████████████████Coffee into code████████████████████▓▓▒▒░░░░░░    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒",
      "▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░    ░░░░░░▒▒▓▓████████████████████████████████████████████████████████████▓▓▒▒░░░░░░    ░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒",
      "▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░    ░░░░░░▓▓████████████████████████████████████████████████████████████████▒▒░░░░░░    ░░░░▒▒▒▒▒▒▒▒▒▒▒▒",
      "▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░  ░░░░▒▒██████████████████████████████████████████████████████████████████▓▓▒▒░░░░    ░░░░▒▒▒▒▒▒▒▒▒▒▒▒",
      "▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░    ░░▒▒████████████████████████████████████████████████████████████████████▒▒░░░░    ░░░░  ▒▒▒▒▒▒▒▒▒▒",
      "▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░    ░░▓▓████████████████████████████████████████████████████████████████████▒▒░░░░            ░░▒▒▒▒▒▒",
      "▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░  ░░░░████████████████████████████████████████████████████████████████████▓▓░░      ░░░░        ▒▒▒▒",
      "▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░    ░░▓▓██████████████████████████████████████████████████████████████████▒▒░░    ░░░░░░░░░░░░    ▒▒",
      "▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒░░░░░░░░  ░░░░░░▒▒░░░░  ▓▓▒▒▓▓██████████████████████████████████████████████████████████████▒▒    ░░░░░░░░░░░░░░░░  ░░",
      "▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░  ░░  ░░░░░░░░▒▒░░░░  ░░▒▒████████████████████████████████████████████████████████████▓▓░░  ░░░░▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░",
      "▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░  ░░  ░░░░░░░░░░▒▒░░░░  ░░▓▓██████████████████████████████████████████████████████████░░  ░░░░░░░░░░░░░░░░░░▒▒▒▒░░",
      "▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░  ░░    ░░░░░░░░░░░░▒▒░░░░  ░░████████████████████████████████████████████████████████░░  ░░░░░░  ░░░░░░  ░░░░▒▒▒▒░░",
      "▓▓▒▒▒▒▒▒▓▓▓▓▓▓▓▓▒▒░░░░░░░░      ░░░░░░░░░░░░▒▒▒▒░░░░  ░░████████████████████████████████████████████████▒▒  ░░░░░░░░          ░░░░░░▒▒▒▒▒▒",
      "▓▓        ▒▒▓▓▓▓▒▒░░░░  ░░░░  ░░░░░░░░░░░░░░░░▒▒▒▒▒▒░░░░░░  ▒▒████████████████████████████████████▓▓░░  ░░░░░░░░░░      ░░░░░░░░░░░░▒▒░░▒▒",
      "▓▓▒▒          ░░▒▒░░  ░░    ░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒░░░░    ░░▓▓██████████████████████▒▒░░    ░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒░░  ▒▒",
      "▓▓▓▓▓▓▒▒░░        ░░  ░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░                  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░▒▒",
      "▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒░░          ░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒░░  ▒▒",
      "▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░      ░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒░░░░  ▒▒",
      "▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒░░▒▒▒▒▒▒░░    ░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░▒▒",
      "▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░▒▒",
      "▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░▒▒▒▒▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░  ░░▒▒▒▒",
      "▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░▒▒▒▒░░░░░░░░░░░░░░░░░░▒▒▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░▒▒▒▒",
      "▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒░░░░░░▒▒░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░▒▒▒▒▒▒",
      "▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░▓▓▓▓▓▓",
      "▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░▒▒▓▓▓▓▓▓",
      "▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓████▒▒░░░░░░░░░░░░▒▒▒▒░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓▓▓▓",
      "▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██▓▓▓▓░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓██████▓▓██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓▓▓▓▓▓",
      "▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██████████▓▓▒▒░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██████████████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓▓▓▓▓▓▓▓",
      "▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██████████████▓▓▒▒░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓████████████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓",
      "▓▓▓▓▓▓▓▓▓▓▓▓▓▓██████████████████▓▓▒▒░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓██████████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓",
      "▓▓▓▓▓▓▓▓▓▓██████████████████████████▓▓▒▒▒▒░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓",
      "▓▓▓▓▓▓▓▓████████████████████████████████▓▓▒▒▒▒░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓",
      "▓▓▓▓▓▓██████████████████████████████████████▓▓▒▒▒▒▒▒░░░░░░░░░░░░░░░░▒▒░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░▒▒██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓",
      "██████████████████████████████████████████████████▓▓▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒████████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓",
      "██████████████████████████████████████████████████████▓▓▓▓▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▓▓██████████████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓",
      "██████████████████████████████████████████████████████████████▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓████████████████████████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓",
      -- "           DO IT! Push the hack! YOLO!                          ",
      -- "                  ▒▒          ▒▒                                ",
      -- "                ▒▒              ▒▒                              ",
      -- "              ▒▒                  ▒▒                            ",
      -- "            ▒▒▒▒                  ▒▒▒▒                          ",
      -- "            ▒▒▒▒                  ▒▒▒▒                          ",
      -- "            ▒▒▒▒██████████████████▒▒▒▒                          ",
      -- "            ████░░    ░░░░░░░░▒▒▒▒████                          ",
      -- "████████████░░░░    ░░░░░░░░▒▒▒▒▒▒▒▒▒▒████████████              ",
      -- "██▒▒▒▒▒▒▒▒░░░░░░  ░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒░░░░    ░░██              ",
      -- "██▒▒▒▒▒▒░░░░    ░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒░░░░    ░░░░██              ",
      -- "  ██▒▒▒▒▓▓▓▓  ░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒░░░░▓▓▒▒▒▒▒▒██                ",
      -- "  ██▒▒▒▒▓▓  ░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒░░░░    ▓▓▒▒▒▒██                ",
      -- "    ██▓▓  ░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒░░░░    ░░░░▓▓██                  ",
      -- "      ██░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒░░░░    ░░░░░░██                    ",
      -- "      ██░░░░░░████▒▒▒▒▒▒▒▒░░░░  ████░░░░░░██                    ",
      -- "      ██░░░░██  ▒▒██▒▒▒▒░░░░  ██  ▒▒██░░▒▒██                    ",
      -- "      ██░░▒▒██▓▓▒▒██▒▒░░░░    ██▓▓▓▓██▒▒▒▒██                    ",
      -- "        ██▒▒▒▒████▒▒░░░░    ░░░░████▒▒▒▒██                      ",
      -- "        ██▒▒▒▒▒▒▒▒░░░░  ██░░░░░░░░▒▒▒▒▒▒██                      ",
      -- "          ██▒▒▒▒░░░░    ░░░░░░░░▒▒▒▒▒▒██                        ",
      -- "            ████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██████                          ",
      -- "                ████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓████                ▒▒▒▒▒▒▒▒",
      -- "              ██  ░░      ▒▒▒▒▒▒▒▒▒▒▒▒░░██                ▒▒▒▒▒▒",
      -- "              ██░░░░░░  ▒▒▒▒▒▒▒▒▒▒▒▒░░░░  ██              ▒▒▒▒▒▒",
      -- "              ██░░    ▒▒▒▒▒▒▒▒▒▒▒▒░░░░    ░░██            ▒▒  ▒▒",
      -- "              ██    ▒▒▒▒▒▒▒▒▒▒▒▒░░░░    ░░░░██          ▒▒▒▒    ",
      -- "              ██  ▒▒▒▒▒▒▒▒▒▒▒▒░░░░    ░░░░░░░░██        ▒▒▒▒    ",
      -- "                ██▒▒▒▒▒▒▒▒▒▒░░░░██  ░░░░░░░░▒▒██        ▒▒▒▒    ",
      -- "                ██▒▒▒▒▒▒▒▒░░░░  ██░░░░░░░░▒▒▒▒██        ▒▒▒▒    ",
      -- "                ██▒▒▒▒▒▒██░░    ██░░░░░░▒▒▒▒▒▒██      ▒▒▒▒      ",
      -- "                ██▒▒▒▒░░██    ░░██░░░░▒▒▒▒▒▒▒▒██    ▒▒▒▒        ",
      -- "                  ██░░░░██  ░░██░░░░▒▒▒▒▒▒▒▒▒▒██▒▒▒▒▒▒          ",
      -- "                  ██░░  ██░░░░██░░▒▒▒▒▒▒▒▒▒▒▒▒██▒▒▒▒            ",
      -- "                  ██    ██░░░░██▒▒▒▒▒▒▒▒▒▒▒▒██                  ",
      -- "                    ▒▒▓▓  ██▓▓██████████████                    ",
      -- "                  Will code for food!                         ",
      -- "                  ████████████████                            ",
      -- "              ████░░░░░░░░░░░░░░░░████                        ",
      -- "██████████████░░░░░░░░░░░░░░░░░░░░░░░░████████████            ",
      -- "██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██            ",
      -- "██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██            ",
      -- "  ██▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒██              ",
      -- "  ██▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒██              ",
      -- "    ██▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒██                ",
      -- "      ██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██                  ",
      -- "      ██░░░░░░████░░░░░░░░░░░░░░████░░░░░░██                  ",
      -- "      ██░░░░██  ▒▒██░░░░░░░░░░██  ▒▒██░░░░██                  ",
      -- "      ██░░░░██▒▒▒▒██░░░░░░░░░░██▒▒▒▒██░░░░██                  ",
      -- "        ██░░░░████░░░░░░░░░░░░░░████░░░░██                    ",
      -- "        ██░░░░░░░░░░▓▓▓▓▓▓▓▓▓▓░░░░░░░░░░██                    ",
      -- "    ▓▓▓▓▓▓██░░░░▓▓▓▓░░░░░░░░░░▓▓▓▓░░░░██                      ",
      -- "  ▓▓░░░░░░▓▓██▓▓░░░░░░░░░░░░░░░░░░▓▓██                        ",
      -- "  ▓▓░░░░░░░░▓▓░░░░░░░░░░░░░░▓▓░░▓▓░░▓▓██                      ",
      -- "    ▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░▓▓░░░░░░▓▓██                    ",
      -- "  ▓▓░░░░░░░░▓▓░░░░░░░░░░░░░░▓▓░░▓▓░░▓▓░░░░██        ██████    ",
      -- "  ▓▓░░░░░░▓▓  ▓▓░░░░░░░░░░░░░░░░░░▓▓░░░░░░██        ██░░░░██  ",
      -- "    ▓▓▓▓▓▓    ██▓▓▓▓░░░░░░░░░░▓▓▓▓░░░░░░░░░░██        ██░░░░██",
      -- "              ██░░░░▓▓▓▓▓▓▓▓▓▓░░░░░░░░░░░░░░██        ██░░░░██",
      -- "                ██░░░░░░░░░░░░░░██░░░░░░░░░░██        ██░░░░██",
      -- "                ██░░░░░░██░░░░░░██░░░░░░░░░░██      ██░░░░░░██",
      -- "                ██░░░░░░██░░░░░░██░░░░░░░░░░██      ██░░░░██  ",
      -- "                ██░░░░░░██░░░░░░██░░░░░░░░░░██    ██░░░░░░██  ",
      -- "                  ██░░░░██░░░░██░░░░░░░░░░░░██████░░░░░░██    ",
      -- "                  ██░░░░██░░░░██░░░░░░░░░░░░░░░░░░░░████      ",
      -- "                  ██░░░░██░░░░██░░░░░░░░░░░░████████          ",
      -- "                    ████  ██████████████████                  ",
    },

    buttons = {
      { "  Find Files", "Spc f f", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
    },
  },

  -- Disable tabufline
  tabufline = {
    enabled = false,
  },
}

-- read the custom plugins
M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
