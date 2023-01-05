require 'lib.moonloader'
local request = require 'requests'
--require "deps" {"fyp:mimgui", "fyp:copas"}
local encoding = require 'encoding'
encoding.default = 'CP1251'
u8 = encoding.UTF8
script_version("1.0")
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
        update() -- переключаем статус активности окна, не забываем про .v
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
	 if version == thisScript().version then
	 print('+')
	 else 
	 update()
	 end
	-- textt = textt:gsub("&", "")
--total_data = {}                                                                                 "/download.php?artist=ATLtitle=?”?µ??????N‹ (Remix)url=ICEsKSEgListKi0oKy9GICssKg">
--[[for html_tag in textt:gmatch("(<a%shref=\"/%a%a%a%a%a%a%a%a%C*)") do -- получаем HTML-тег полностью

local index = #total_data + 1 -- чтобы данные заносились в ту же таблицу
    total_data[index] = {text = {}, classes = {}} -- интересно, конечно, почему, но без этого костыля, будет выдавать ошибку о неизвестном индексе
    total_data[index].text = html_tag:match("\"(.+)\"")  -- получаем эту часть <a>(TEXT)</a>
	
   local classes = {} --url=ICEsKSEgListKi0oKy9GICssKg
    for ar, tit, ur in html_tag:gmatch("artist=(.-)title=(.-)url=(.-)\"") do --<div class="artist">ATL</div>
        table.insert(classes, {ar, tit, ur}) -- заносим эти части <span (cl)="(...)" ... >
     
end	--%s(.-)=\"(.-)\"""%s(.-)=\"(.-)\"
    total_data[index].classes = classes

	end]]--
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
    response = requests.get('https://raw.githubusercontent.com/Durman96/test/main/raw%20request.lua?token=GHSAT0AAAAAAB5DXAAA6PNT2XXCSBNDAB42Y5XGGVA')
	local dat = response.text
	 --local url = resp:match('"url":"(.*)"')
	 print(dat)
end
--Инструменты
----------------------------------------------------------asyncHttpRequest---------------------------------------------------------------------
function asyncHttpRequest(method, url, args, resolve, reject)
   local request_thread = effil.thread(function (method, url, args)
      local requests = require 'requests'
      local result, response = pcall(requests.request, method, url, args)
      if result then
         response.json, response.xml = nil, nil
         return true, response
      else
         return false, response
      end
   end)(method, url, args)
   -- Если запрос без функций обработки ответа и ошибок.
   if not resolve then resolve = function() end end
   if not reject then reject = function() end end
   -- Проверка выполнения потока
   lua_thread.create(function()
      local runner = request_thread
      while true do
         local status, err = runner:status()
         if not err then
            if status == 'completed' then
               local result, response = runner:get()
               if result then
                  resolve(response)
               else
                  reject(response)
               end
               return
            elseif status == 'canceled' then
               return reject(status)
            end
         else
            return reject(err)
         end
         wait(0)
      end
   end)
end
