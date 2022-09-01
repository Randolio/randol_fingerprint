fx_version 'cerulean'
game 'gta5'

author 'Randolio'
description 'Mobile Fingerprint for Police. | PS-MDT event <3'

shared_scripts {
	'@ps-mdt/shared/config.lua',
}

client_scripts {
	"cl_fingerprint.lua"
}

server_scripts { 
	"sv_fingerprint.lua"
}

lua54 'yes'
