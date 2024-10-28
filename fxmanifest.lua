---@diagnostic disable: undefined-global

Dev = "dev";

fx_version 'bodacious'
games { 'gta5', 'rdr3' }

author 'Absolute'
description 'qx class system'
version '0.0.1'

ui_page 'http://localhost:4200'
lua54 'yes'

files{

}
shared_scripts {
    "config/en.lua",
    "ats-core.lua",
    "project.lua",
    "shared/env/EnvDev.lua",
    "interface.lua",
    "core/**",
    "locales/**",
    "shared/tools/**",
    "shared/classes/**",
}

server_scripts{
    "server/classes/**",
}
client_scripts {
    "client/classes/**",
}
