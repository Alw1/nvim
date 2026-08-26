local M = {}

function M.gh(repo)
	return "https://github.com/" .. repo
end

function M.add(specs)
	vim.pack.add(specs, { confirm = false })
end

return M
