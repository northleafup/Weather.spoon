-- copy and change from https://github.com/wangshub/hammerspoon-config/blob/master/weather/weather.lua
local obj = { __gc = true }
obj.__index = obj
obj.__gc = function(t)
    t:stop()
end

-- Metadata
obj.name = "Weather"
obj.version = "1.0"

local urlApi = ''
local menubar = hs.menubar.new()
local menuData = {}
local cityWeather = ''
local weaEmoji = {
   lei = '⛈',
   qing = '☀️',
   shachen = '😷',
   wu = '🌫',
   xue = '❄️',
   yu = '🌧',
   yujiaxue = '🌨',
   yun = '☁️',
   zhenyu = '🌧',
   yin = '⛅️',
   default = ''
}

function obj:init()
    custom_config = hs.fs.pathToAbsolute(os.getenv("HOME") .. '/.hammerspoon/private/weather.lua')
    if custom_config then
        print("Loading weather.lua")
        require('private/weather')
        urlApi = weatherurl
    else
        if menubar then 
            menubar.delete()
        end
        print("There is no weather.lua file in ~/.hammerspoon/private/")
        return
    end
    obj:start()
end


function obj:start()
    menubar:setTooltip("今日天气")
    menubar:setTitle('⌛')
    getWeather()
    hs.timer.doEvery(3600, getWeather)
    return self
end

function obj:stop()
    if menubar then menubar.delete() end
    menubar = nil
end

function getWeather()
   hs.http.asyncGet(urlApi, tab, function(code, body,htable)
	  menubar:setTooltip(body)
      if code ~= 200 then
         print('get weather error:'..code)
	     menubar:setTooltip(code)
         return
      end
      rawjson = hs.json.decode(body)
      city = rawjson.city
      menuData = {}
      for k, v in pairs(rawjson.data) do
         if k == 1 then
            menubar:setTitle(weaEmoji[v.wea_img])
            titlestr = string.format("%s %s %s 🌡️%s 💧%s 💨%s 🌬 %s %s", city,weaEmoji[v.wea_img],v.day, v.tem, v.humidity, v.air, v.win_speed, v.wea)
            menubar:setTooltip(string.format("%s天气" , string.format("%s %s %s 🌡️%s 💧%s 💨%s 🌬 %s %s", city,weaEmoji[v.wea_img],v.day, v.tem, v.humidity, v.air, v.win_speed, v.wea)))
            item = { title = titlestr }
            table.insert(menuData, item)
            table.insert(menuData, {title = '-'})
         else
            titlestr = string.format("%s %s %s 🌡️%s 🌬%s %s", city, weaEmoji[v.wea_img],v.day, v.tem, v.win_speed, v.wea)
            item = { title = titlestr }
            table.insert(menuData, item)
         end
      end
      menubar:setMenu(menuData)
   end)
end

return obj
