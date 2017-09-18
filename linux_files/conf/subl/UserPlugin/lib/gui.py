#!/usr/bin/env python
import gi
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk, Gdk

class EntryWindow(Gtk.Window):

    def __init__(self):
        Gtk.Window.__init__(self, title="")
        self.set_default_size(400, -1)

        self.entry = Gtk.Entry()
        self.entry.connect("key-press-event", self.on_key_press_event)
        self.add(self.entry)

    def on_key_press_event(self, widget, event):
        k = Gdk.keyval_name(event.keyval)
        if (k == "Return"):
            print(self.entry.get_text())
            Gtk.main_quit()

        if (k == "Escape"):
            Gtk.main_quit()

win = EntryWindow()
win.connect("delete-event", Gtk.main_quit)
win.show_all()
Gtk.main()
