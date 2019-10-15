# Weather.spoon
Weather.spoon for hammerspoon
## What is this

It is a spoon for hammerspoon



## Where is from 

Copy and change from  [here](https://github.com/wangshub/hammerspoon-config) and [there](https://github.com/Hammerspoon/Spoons/tree/master/Spoons)

## How to use in MacOs  

##### 1. Clone code 

```bash
cd ~
cd .hammerspoon/Spoons
git clone https://github.com/northleafup/Weather.spoon.git
```

##### 2. Update `.hammerspoon/init.lua` file 

Load this spoon 

```lua
hs.loadSpoon("Weather")
```

## How to use in MacOs with  [my config](https://github.com/northleafup/my-hammerspoon)

##### 1. Clone code

```bash
cd ~
cd .hammerspoon/Spoons
git clone https://github.com/northleafup/Weather.spoon.git
```

##### 2. Load Specify Spoon 

please refer [this](https://github.com/northleafup/my-hammerspoon#2-load-specify-spoon).

## Add yourself weather api url 

##### 1. Create private folder 

Create yourseft config .If there is no directory "~/.hammerspoon/private", please make it 

```bash
cd ~
cd .hammerspoon
mkdir private
```

##### 2. Copy example config 

Copy example config

```bash
cd ~
cp .hammerspoon/Spoons/Weather.spoon/weather.lua ~/.hammerspoon/private/weather.lua
```

##### 3. Update the weather api url 

```lua
weatherurl = 'https://www.tianqiapi.com/api?version=v1&appid=1111111111&&appsecret=nN1u'
```

You can apply weather api url [here](https://www.tianqiapi.com)



## Thanks To



[https://github.com/wangshub/hammerspoon-config](https://github.com/wangshub/hammerspoon-config)