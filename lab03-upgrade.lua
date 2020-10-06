#!/bin/lua5.3
lgi = require 'lgi'
gtk = lgi.Gtk
gdk = lgi.Gdk
gtk.init()
bld = gtk.Builder()
bld:add_from_file('lab03-upgrade.glade')

prov = gtk.CssProvider()
prov:load_from_path('lab03.css')

ctx = gtk.StyleContext()
scr = gdk.Screen.get_default()
ctx.add_provider_for_screen(scr, prov, gtk.STYLE_PROVIDER_PRIORITY_APPLICATION)

ui = bld.objects

ui.wnd.title = 'lab-03-zhuravleva-upgrade'
ui.wnd.on_destroy = gtk.main_quit
ui.wnd:show_all()

chb = {ui.chb1, ui.chb2, ui.chb3, ui.chb4}

function ui.button:on_clicked(...)
for i=1,4 do
chb[i].active = false
end
num = tonumber(ui.entry.text)
if (num<16) then 
if (num>-1) then
	for i=4,1,-1 do
	flag = num%2
	num= math.floor(num/2)
--if num == 1 then chb[i].active = true 
		if flag==1 then chb[i].active = true 
		end
	end
end
end
end
ui.wnd.on_destroy = gtk.main_quit
ui.wnd:show_all()
gtk.main()
