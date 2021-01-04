fx_version 'adamant'
games { 'gta5' }

author 'Cloudy'
description 'Metal Detectors'
version '0.1'

data_file 'DLC_ITYP_REQUEST' 'stream/props/sec_props_metadata_01.ytyp'

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