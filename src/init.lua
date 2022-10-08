local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local packages = ReplicatedStorage.Packages

local player = Players.LocalPlayer

local LiveDebugToolkit = {}
LiveDebugToolkit.__index = LiveDebugToolkit

function LiveDebugToolkit.new()
	local self = setmetatable({
		_playerGui = player:WaitForChild("PlayerGui");
		_visible = false;
		_tools = {};
		_activeTools = {};
	}, LiveDebugToolkit)

	return self
end

function LiveDebugToolkit:init()
	self:setEnabled(true)
end

function LiveDebugToolkit:registerTool(tool)
	table.insert(self._tools, tool)
end

function LiveDebugToolkit:setEnabled(enabled)
	self._enabled = enabled
end

return LiveDebugToolkit