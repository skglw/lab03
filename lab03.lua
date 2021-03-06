#!/bin/lua5.3
lgi = require 'lgi'
gtk = lgi.Gtk
gdk = lgi.Gdk
gtk.init()
bld = gtk.Builder()
bld:add_from_file('lab03.glade')

prov = gtk.CssProvider()
prov:load_from_path('lab03.css')

ctx = gtk.StyleContext()
scr = gdk.Screen.get_default()
ctx.add_provider_for_screen(scr, prov, gtk.STYLE_PROVIDER_PRIORITY_APPLICATION)

ui = bld.objects

ui.rbA.active = false;
ui.wnd.title = 'lab-03-zhuravleva'
ui.wnd.on_destroy = gtk.main_quit
ui.wnd:show_all()

rb = { ui.rbA, ui.rbB, ui.rbC, ui.rbD, ui.rbE, ui.rbF, ui.rbG, ui.rbH}

function update()
x = 0
y = 0
z = 0
if ui.chb1.active == true then x = 1 end
if ui.chb2.active == true then y = 1 end
if ui.chb3.active == true then z = 1 end

v = x * 4 + y * 2 + z * 1
rb[v + 1].active = true

ui.lRes.label = v
end

function ui.chb1:on_clicked(...)
update()
end

function ui.chb2:on_clicked(...)
update()
end

function ui.chb3:on_clicked(...)
update()
end

ui.wnd.on_destroy = gtk.main_quit
ui.wnd:show_all()
gtk.main()
