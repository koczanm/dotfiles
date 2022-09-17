local present, symbols = pcall(require, "symbols-outline")

if not present then
  return
end

symbols.setup()
