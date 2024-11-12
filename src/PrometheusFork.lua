-- This Script is Part of the PrometheusFork Obfuscator by User319183
-- PrometheusFork.lua
-- This file is the entrypoint for PrometheusFork

-- Require PrometheusFork Submodules
local Pipeline  = require("PrometheusFork.pipeline")
local highlight = require("highlightlua")
local colors    = require("colors")
local Logger    = require("logger")
local Presets   = require("presets")
local Config    = require("config")
local util      = require("PrometheusFork.util")

-- Export
return {
    Pipeline  = Pipeline,
    colors    = colors,
    Config    = util.readonly(Config), -- Readonly
    Logger    = Logger,
    highlight = highlight,
    Presets   = Presets,
}