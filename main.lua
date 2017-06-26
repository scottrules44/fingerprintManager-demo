local fingerprintManager = require "plugin.fingerprintManager"

local bg = display.newRect( display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight )
bg:setFillColor( 0,1,0 )

local title = display.newText( "Fingerprint Manager", display.contentCenterX, 30, native.systemFontBold, 30 )
if (system.getInfo("platform") == "android" and system.getInfo("environment") == "device" and system.getInfo("androidApiLevel") >= 23) then
	local sensorStatus = display.newText( "sensorStatus:"..fingerprintManager.sensorStatus(), display.contentCenterX, display.contentCenterY-40, native.systemFont, 15 )
	if (fingerprintManager.sensorStatus() == "has access") then
		status = display.newText( "status: detecting (Place finger on sensor)", display.contentCenterX, display.contentCenterY-20, native.systemFont, 10 )
	end
	fingerprintManager.detect(function (e)
		status.text = "status: "..e.response
	end)
elseif (system.getInfo("platform") == "android" and system.getInfo("environment") == "device" and system.getInfo("androidApiLevel") < 23) then
	local status = display.newText( "Not supported on this api level, you must have 6.0 (Marshmallow) or Higher", display.contentCenterX, display.contentCenterY, display.actualContentWidth, 100 ,native.systemFont, 20 )
else
	local status = display.newText( "Not supported on this platform", display.contentCenterX, display.contentCenterY ,native.systemFont, 20 )
end

