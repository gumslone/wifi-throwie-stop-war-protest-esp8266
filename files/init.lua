print ("---------------------")
print("Setting up WiFi AP...")

 wifi.setmode(wifi.SOFTAP)
 cfg={}
     cfg.ssid="Stop Putin! - Stop War!"
     wifi.ap.config(cfg)

print("Done.")
print ("---------------------")

majorVer, minorVer, devVer, chipid, flashid, flashsize, flashmode, flashspeed = node.info();
print("Flash size is "..flashsize.." kBytes.")

remaining, used, total=file.fsinfo()
    print("File system:\n Total : "..(total/1024).." kBytes\n Used  : "..(used/1024).." kBytes\n Remain: "..(remaining/1024).." kBytes")

local compileAndRemoveIfNeeded = function(f)
    wifi.sta.clearconfig()
    if file.open(f) then
      file.close()
      print('Compiling:', f)
      node.compile(f)
      file.remove(f)
      collectgarbage()
    else
    print("No need to compile ", f )
    end
end
print ("---------------------")
print("Compiling LUA files...")

local serverFiles = {'dns-liar.lua', 'server.lua'}
for i, f in ipairs(serverFiles) do compileAndRemoveIfNeeded(f) end

compileAndRemoveIfNeeded = nil
serverFiles = nil
collectgarbage()

print("Compiling done.")
print ("---------------------")

function startup()

	print ("---------------------")
    print('Starting HTTP Server')
    dofile('server.lc')
    print ('Starting DNS Server')
    dofile('dns-liar.lc')
	print ("---------------------")
    end



print ('Will launch servers in 5 seconds...')
tmr.create():alarm(5000,tmr.ALARM_SINGLE,startup)