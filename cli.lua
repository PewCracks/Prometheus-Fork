-- This Script is Part of the PrometheusFork Obfuscator by User319183
--
-- cli.lua
-- This script contains the Code for the PrometheusFork CLI

-- Configure package.path for requiring PrometheusFork
local function script_path()
    return debug.getinfo(2, "S").source:sub(2):match("(.*/)") or "./"
end
package.path = script_path() .. "?.lua;" .. package.path
require("src.cli")