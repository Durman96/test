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
local MainWindow = new.bool()
local sizeX, sizeY = getScreenResolution()
local input_id = new.char[256]('523849782')
local button_status = ti.ICON_PLAYER_PLAY
local play = false
local function loadIconicFont(fontSize)
    local config = imgui.ImFontConfig()
    config.MergeMode = true
    config.PixelSnapH = true
    local iconRanges = imgui.new.ImWchar[3](ti.min_range, ti.max_range, 0)
    imgui.GetIO().Fonts:AddFontFromMemoryCompressedBase85TTF(ti.get_font_data_base85(), fontSize, config, iconRanges)
end

imgui.OnInitialize(function()
    loadIconicFont(14)
    imgui.GetIO().IniFilename = nil
	imgui.DarkTheme()
end)

local newFrame = imgui.OnFrame(
    function() return MainWindow[0] end,
    function(player)
        imgui.SetNextWindowPos(imgui.ImVec2(sizeX / 2, sizeY/ 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
        imgui.SetNextWindowSize(imgui.ImVec2(650, 400), imgui.Cond.FirstUseEver)
           imgui.Begin('##window', _, imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoResize + imgui.WindowFlags.NoTitleBar)
		   imgui.PushItemWidth(150)
		 imgui.SetCursorPos(imgui.ImVec2(5,15))  
		  imgui.Text('id') 
		 imgui.SetCursorPos(imgui.ImVec2(20,10)) 
		  imgui.InputText(u8"##", input_id, sizeof(input_id))
		  imgui.PopItemWidth()
			--imgui.Text((str(input_id)))
			imgui.SetCursorPos(imgui.ImVec2(175,10))
		 if imgui.Button(u8'Применить') then
		press = true
		get()
end 
imgui.SameLine()
imgui.SetCursorPos(imgui.ImVec2(620,10))
imgui.Text(ti.ICON_SETTINGS)
imgui.BeginChild('main2', imgui.ImVec2(635, 350), true)									
if press then
for k,v in ipairs(total_data) do 
--print(total_data[2]["classes"][1][3]) -- индекс  строка(всего 1) таблица
--print(total_data[k]["classes"][1][3])
		for _, t in ipairs(v.classes) do
		
if imgui.Button(button_status..'##'..k) then
--	audio()
play = not play
if onlinesong == nil then
button_status = ti.ICON_PLAYER_PLAY
end
local http_audio = "https://downloadmusicvk.ru/audio/play?data=QjlCYmJZakc0S3RXY2l4UTdnUldBMGFLMEthOENqUzBabXdJdE1LT0RwSER6VTRDVHVBNlFnV1JnMHArK2VvdjB6OXZTd1BybVZiVHh0OGZkMlQrb1lMRlF6aDRKMDAwQ2ZuZmdRd3hUVDZRM0taaWh2N2ErcG1BOGt4ZFV0TlJyczI3TkhHOVlCZGNwMGdlekMvOXNGWFRseUZFTm1SbHdBT2dtNWNqUWl3Qjhqb1FhdHVrMEJ0Y3lJQ0RIcWsrR0dxTFd3THVIb1FMR29LNkJZdnBWVDRaOUZEaXRYT1g4TWkrTGgzOVBlTHl5b1pTTXVmUUhRUGNMTXNhTTQxUUV5Q2NSb1paTXF2SGgrZFE5QzRleXR6WHN0dG12UVdmNmRuZE12OUpzK3k3SVZEcFljcC9OcC93SDhBTEdxbWF5ejltV0xJU0JHQm5MTDNhSUI4MjB0c0Q3QmJTOFVRRnlLcFJmVlBWZGpROTM1bzZ5bXltOXI1TEorazN5WmRP"
if play then

	button_status = ti.ICON_PLAYER_PAUSE
	else
	setAudioStreamState(onlinesong, as_action.STOP)
	button_status = ti.ICON_PLAYER_PLAY
	end
end
imgui.SameLine()
imgui.Text(""..t[1].."\n"..t[2].."\n\n")
		end
	end	
end	
imgui.EndChild()		
    imgui.End()
end
)
--function audio()


function imgui.DarkTheme()
    imgui.SwitchContext()
    --==[ STYLE ]==--
    imgui.GetStyle().WindowPadding = imgui.ImVec2(5, 5)
    imgui.GetStyle().FramePadding = imgui.ImVec2(5, 5)
    imgui.GetStyle().ItemSpacing = imgui.ImVec2(5, 5)
    imgui.GetStyle().ItemInnerSpacing = imgui.ImVec2(2, 2)
    imgui.GetStyle().TouchExtraPadding = imgui.ImVec2(0, 0)
    imgui.GetStyle().IndentSpacing = 0
    imgui.GetStyle().ScrollbarSize = 10
    imgui.GetStyle().GrabMinSize = 10

    --==[ BORDER ]==--
    imgui.GetStyle().WindowBorderSize = 1
    imgui.GetStyle().ChildBorderSize = 1
    imgui.GetStyle().PopupBorderSize = 1
    imgui.GetStyle().FrameBorderSize = 1
    imgui.GetStyle().TabBorderSize = 1

    --==[ ROUNDING ]==--
    imgui.GetStyle().WindowRounding = 5
    imgui.GetStyle().ChildRounding = 5
    imgui.GetStyle().FrameRounding = 5
    imgui.GetStyle().PopupRounding = 5
    imgui.GetStyle().ScrollbarRounding = 5
    imgui.GetStyle().GrabRounding = 5
    imgui.GetStyle().TabRounding = 5

    --==[ ALIGN ]==--
    imgui.GetStyle().WindowTitleAlign = imgui.ImVec2(0.5, 0.5)
    imgui.GetStyle().ButtonTextAlign = imgui.ImVec2(0.5, 0.5)
    imgui.GetStyle().SelectableTextAlign = imgui.ImVec2(0.5, 0.5)
    
    --==[ COLORS ]==--
    imgui.GetStyle().Colors[imgui.Col.Text]                   = imgui.ImVec4(1.00, 1.00, 1.00, 1.00)
    imgui.GetStyle().Colors[imgui.Col.TextDisabled]           = imgui.ImVec4(0.50, 0.50, 0.50, 1.00)
    imgui.GetStyle().Colors[imgui.Col.WindowBg]               = imgui.ImVec4(0.07, 0.07, 0.07, 1.00)
    imgui.GetStyle().Colors[imgui.Col.ChildBg]                = imgui.ImVec4(0.07, 0.07, 0.07, 1.00)
    imgui.GetStyle().Colors[imgui.Col.PopupBg]                = imgui.ImVec4(0.07, 0.07, 0.07, 1.00)
    imgui.GetStyle().Colors[imgui.Col.Border]                 = imgui.ImVec4(0.25, 0.25, 0.26, 0.54)
    imgui.GetStyle().Colors[imgui.Col.BorderShadow]           = imgui.ImVec4(0.00, 0.00, 0.00, 0.00)
    imgui.GetStyle().Colors[imgui.Col.FrameBg]                = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
    imgui.GetStyle().Colors[imgui.Col.FrameBgHovered]         = imgui.ImVec4(0.25, 0.25, 0.26, 1.00)
    imgui.GetStyle().Colors[imgui.Col.FrameBgActive]          = imgui.ImVec4(0.25, 0.25, 0.26, 1.00)
    imgui.GetStyle().Colors[imgui.Col.TitleBg]                = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
    imgui.GetStyle().Colors[imgui.Col.TitleBgActive]          = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
    imgui.GetStyle().Colors[imgui.Col.TitleBgCollapsed]       = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
    imgui.GetStyle().Colors[imgui.Col.MenuBarBg]              = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
    imgui.GetStyle().Colors[imgui.Col.ScrollbarBg]            = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
    imgui.GetStyle().Colors[imgui.Col.ScrollbarGrab]          = imgui.ImVec4(0.00, 0.00, 0.00, 1.00)
    imgui.GetStyle().Colors[imgui.Col.ScrollbarGrabHovered]   = imgui.ImVec4(0.41, 0.41, 0.41, 1.00)
    imgui.GetStyle().Colors[imgui.Col.ScrollbarGrabActive]    = imgui.ImVec4(0.51, 0.51, 0.51, 1.00)
    imgui.GetStyle().Colors[imgui.Col.CheckMark]              = imgui.ImVec4(1.00, 1.00, 1.00, 1.00)
    imgui.GetStyle().Colors[imgui.Col.SliderGrab]             = imgui.ImVec4(0.21, 0.20, 0.20, 1.00)
    imgui.GetStyle().Colors[imgui.Col.SliderGrabActive]       = imgui.ImVec4(0.21, 0.20, 0.20, 1.00)
    imgui.GetStyle().Colors[imgui.Col.Button]                 = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
    imgui.GetStyle().Colors[imgui.Col.ButtonHovered]          = imgui.ImVec4(0.21, 0.20, 0.20, 1.00)
    imgui.GetStyle().Colors[imgui.Col.ButtonActive]           = imgui.ImVec4(0.41, 0.41, 0.41, 1.00)
    imgui.GetStyle().Colors[imgui.Col.Header]                 = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
    imgui.GetStyle().Colors[imgui.Col.HeaderHovered]          = imgui.ImVec4(0.20, 0.20, 0.20, 1.00)
    imgui.GetStyle().Colors[imgui.Col.HeaderActive]           = imgui.ImVec4(0.47, 0.47, 0.47, 1.00)
    imgui.GetStyle().Colors[imgui.Col.Separator]              = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
    imgui.GetStyle().Colors[imgui.Col.SeparatorHovered]       = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
    imgui.GetStyle().Colors[imgui.Col.SeparatorActive]        = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
    imgui.GetStyle().Colors[imgui.Col.ResizeGrip]             = imgui.ImVec4(1.00, 1.00, 1.00, 0.25)
    imgui.GetStyle().Colors[imgui.Col.ResizeGripHovered]      = imgui.ImVec4(1.00, 1.00, 1.00, 0.67)
    imgui.GetStyle().Colors[imgui.Col.ResizeGripActive]       = imgui.ImVec4(1.00, 1.00, 1.00, 0.95)
    imgui.GetStyle().Colors[imgui.Col.Tab]                    = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
    imgui.GetStyle().Colors[imgui.Col.TabHovered]             = imgui.ImVec4(0.28, 0.28, 0.28, 1.00)
    imgui.GetStyle().Colors[imgui.Col.TabActive]              = imgui.ImVec4(0.30, 0.30, 0.30, 1.00)
    imgui.GetStyle().Colors[imgui.Col.TabUnfocused]           = imgui.ImVec4(0.07, 0.10, 0.15, 0.97)
    imgui.GetStyle().Colors[imgui.Col.TabUnfocusedActive]     = imgui.ImVec4(0.14, 0.26, 0.42, 1.00)
    imgui.GetStyle().Colors[imgui.Col.PlotLines]              = imgui.ImVec4(0.61, 0.61, 0.61, 1.00)
    imgui.GetStyle().Colors[imgui.Col.PlotLinesHovered]       = imgui.ImVec4(1.00, 0.43, 0.35, 1.00)
    imgui.GetStyle().Colors[imgui.Col.PlotHistogram]          = imgui.ImVec4(0.90, 0.70, 0.00, 1.00)
    imgui.GetStyle().Colors[imgui.Col.PlotHistogramHovered]   = imgui.ImVec4(1.00, 0.60, 0.00, 1.00)
    imgui.GetStyle().Colors[imgui.Col.TextSelectedBg]         = imgui.ImVec4(1.00, 0.00, 0.00, 0.35)
    imgui.GetStyle().Colors[imgui.Col.DragDropTarget]         = imgui.ImVec4(1.00, 1.00, 0.00, 0.90)
    imgui.GetStyle().Colors[imgui.Col.NavHighlight]           = imgui.ImVec4(0.26, 0.59, 0.98, 1.00)
    imgui.GetStyle().Colors[imgui.Col.NavWindowingHighlight]  = imgui.ImVec4(1.00, 1.00, 1.00, 0.70)
    imgui.GetStyle().Colors[imgui.Col.NavWindowingDimBg]      = imgui.ImVec4(0.80, 0.80, 0.80, 0.20)
    imgui.GetStyle().Colors[imgui.Col.ModalWindowDimBg]       = imgui.ImVec4(0.00, 0.00, 0.00, 0.70)
end





function main()
    while not isSampAvailable() do wait(0) end
	
    while true do
        wait(0)
		if wasKeyPressed(vkeys.VK_X) then -- активация по нажатию клавиши X
        raw() -- переключаем статус активности окна, не забываем про .v
    end
    imgui.Process = MainWindow[0]
	
		
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
requests = require 'requests'
    response = requests.get(http)
	local resp = response.text
	 local url = resp:match('"url":"(.*)"')
	 print(url)
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
