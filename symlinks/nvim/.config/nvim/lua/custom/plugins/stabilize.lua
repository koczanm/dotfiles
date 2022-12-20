local present, stabilize = pcall(require, "stabilize")

if not present then
	return
end

stabilize.setup()
