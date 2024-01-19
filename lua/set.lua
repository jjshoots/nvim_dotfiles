-- remap the clipboard
vim.g.clipboard = {
 name = "xsel",
 copy = {
  ["+"] = "xsel --nodetach -i -b",
  ["*"] = "xsel --nodetach -i -p",
 },
 paste = {
  ["+"] = "xsel  -o -b",
  ["*"] = "xsel  -o -b",
 },
 cache_enabled = 1,
}
