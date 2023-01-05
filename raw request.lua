require 'lib.moonloader'
local request = require 'requests'
--require "deps" {"fyp:mimgui", "fyp:copas"}
local encoding = require 'encoding'
encoding.default = 'CP1251'
u8 = encoding.UTF8
script_version("1.1")
local ti = require 'tabler_icons'
local inspect = require 'inspect'
local press = false
local ffi = require "ffi"
local vkeys = require "vkeys"
local inicfg = require "inicfg"
local effil = require 'effil'
local imgui = require 'mimgui' -- Подключаем саму библиотеку
local as_action = require('moonloader').audiostream_state
local new, str, sizeof = imgui.new, ffi.string, ffi.sizeof

function main()
    while not isSampAvailable() do wait(0) end
	
    while true do
        wait(0)
		if wasKeyPressed(vkeys.VK_X) then -- активация по нажатию клавиши X
        get() -- переключаем статус активности окна, не забываем про .v
    end
	
		
    end
end
--<td id="LC2" class="blob-code blob-code-inner js-file-line">  <span class="pl-ent">"last"</span>:<span class="pl-s"><span class="pl-pds">"</span>1.1<span class="pl-pds">"</span></span>,</td>

-- https://vrit.me/audios523849782
--href="/download.php?artist=Sinny, 7vvch&title=Numb&url=ICEsKCEvListKi0rKy9GICssKg"
local http = "https://raw.githubusercontent.com/Durman96/gun_manager/main/refresh.json"
--   "last":"1.1",
 -- "url":"https://raw.githubusercontent.com/Durman96/gun_manager/main/Gun%20Manager.lua"
function get()
 requests = require 'requests'
    response = requests.get(http)
	local resp = response.text
	 local version = resp:match('"last":"(%d%.%d)"')
	 --print(version)
	 if version > thisScript().version then
	 update()
	 else 
	 print('Обновление не требуется')
	 end
end
function raw()
requests = require 'requests'
    response = requests.get('https://raw.githubusercontent.com/Durman96/gun_manager/main/Gun%20Manager.lua')
	local main = response.text
	print(main)
	end
function update()
local ds = require('moonloader').download_status
requests = require 'requests'
    response = requests.get('https://raw.githubusercontent.com/Durman96/test/main/upd.json?token=GHSAT0AAAAAAB5DXAAASXTFTNAPBKFO4VFQY5XG4AQ')
	local dat = response.text
	 local url = dat:match('"url":"(.*)"')
	 print(url)
end

