function recursiveEnumerate(folder, file_list)
	local items = love.filesystem.getDirectoryItems(folder)
	for _, item in ipairs(items) do
		local file = folder .. "/" .. item
		if love.filesystem.isFile(file) then
			table.insert(file_list, file)
		elseif love.filesystem.isDirectory(file) then
			recursiveEnumerate(file, file_list)
		end
	end
end

function requireFiles(files)
	for _, file in ipairs(files) do
		local file = file:sub(1, -5)
		-- splitting file on around /, gmatch returns table of matched values
		last_match = ""
		for item in string.gmatch(file, "%w+") do
			last_match = item
		end
		-- print("Target object Name \n" .. last_match)
		-- print("Target file \n" .. file)
		require(file)
	end
end
