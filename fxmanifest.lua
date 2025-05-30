fx_version 'cerulean'
game 'gta5'

description 'Alpha Medkit - QBCore Revival System'
version '1.0.0'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'config.lua'
}

client_scripts {
    'client/main.lua'
}

server_scripts {
    'server/main.lua'
}

dependencies {
    'qb-core',
    'qb-target',
    'minigames'
} 