#!/bin/lua5.3
lgi = require 'lgi'
gtk = lgi.Gtk
gdk = lgi.Gdk
gtk.init()

bld = gtk.Builder()
bld:add_from_file('lab03-upgrade.glade')
prov = gtk.CssProvider()
prov:load_from_path('lab03-upgrade.css')

ctx = gtk.StyleContext()
scr = gdk.Screen.get_default()
ctx.add_provider_for_screen(scr, prov, gtk.STYLE_PROVIDER_PRIORITY_APPLICATION)

ui = bld.objects
ui.wnd.title = 'lab-03-zhuravleva-upgrade'
ui.wnd.on_destroy = gtk.main_quit
ui.wnd:show_all()

chb = {ui.chb4, ui.chb3, ui.chb2, ui.chb1}
lbl = {ui.label4, ui.label3, ui.label2, ui.label1}

function ui.entry:on_changed(...)

for i = 1,4 do
chb[i].active = false
lbl[i].label = ""
end

num = tonumber(ui.entry.text)

if num < 16 then 
if num > -1 then

for i = 1,4 do
lbl[i].label = 0
end

for i = 1,4 do
max = math.pow(2, i)-1
if max >= num then max = i break end
end

	for i = 1,max do
	flag = num%2
	num = math.floor(num / 2)
		if flag == 1 then 
			chb[i].active = true 
			lbl[i].label = 1
		end
	end
end
end
end
ui.wnd.on_destroy = gtk.main_quit
ui.wnd:show_all()
gtk.main()
