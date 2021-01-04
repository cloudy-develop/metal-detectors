fx_version 'adamant'
games { 'gta5' }

author 'Cloudy'
description 'Metal Detectors'
version '0.1'

data_file 'DLC_ITYP_REQUEST' 'stream/props/ch_prop_ch_casino_security.ytyp'

client_scripts {
    
    -- main/src --
    'main/src/client/*.lua',
    
    -- config --
    'config.lua'

}

server_scripts {

    -- main/src --
    'main/src/server/*.lua'

}