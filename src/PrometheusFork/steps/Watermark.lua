-- This Script is Part of the PrometheusFork Obfuscator by User319183
--
-- Watermark.lua
--
-- This Script provides a Step that will add a watermark to the script

local Step = require("PrometheusFork.step")
local Ast = require("PrometheusFork.ast")
local Scope = require("PrometheusFork.scope")
local escape = require("PrometheusFork.util").escape

local Watermark = Step:extend()
Watermark.Description = "This Step will add a robust watermark to the script"
Watermark.Name = "RobustWatermark"

Watermark.SettingsDescriptor = {
  Content = {
    name = "Content",
    description = "The Content of the Watermark",
    type = "string",
    default = "This script is safeguarded by PrometheusFork, an advanced Lua obfuscation technology devised by User319183."
  },
  CustomVariable = {
    name = "Custom Variable",
    description = "The Variable that will be used for the Watermark",
    type = "string",
    default = "__PrometheusFork__",
  }
}

function Watermark:init(settings)
end

function Watermark:apply(ast)
  local body = ast.body
  if string.len(self.Content) > 0 then
    local scope, variable = ast.globalScope:resolve(self.CustomVariable)
    local watermark = Ast.AssignmentVariable(ast.globalScope, variable)
    local functionScope = Scope:new(body.scope)
    functionScope:addReferenceToHigherScope(ast.globalScope, variable)
    -- Embed the watermark in a less obvious way. Let shouldEscape be false
    local embeddedWatermark = Ast.WatermarkExpression(self.Content)
    local statement = Ast.AssignmentStatement({
      watermark
    }, {
      embeddedWatermark
    })
    -- Insert the watermark at a random position within the script
    local insertPosition = math.random(1, #ast.body.statements)
    table.insert(ast.body.statements, insertPosition, statement)
  end
end

return Watermark