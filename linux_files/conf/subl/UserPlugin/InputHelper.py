import sublime
import sublime_plugin
import subprocess
import os

class InputHelperCommand(sublime_plugin.TextCommand):

    def run(self, edit):
        sel = self.view.sel()
        selected = None
        text_output = None
        args = []
        if len(sel) > 0:
            selected = sel

        if sublime.platform() == 'linux':
            current_path = os.path.dirname(os.path.realpath(__file__))

            location = os.path.join(current_path, 'lib', 'gui.py')
            args = [location]

            proc = subprocess.Popen(args, stdout=subprocess.PIPE)
            text_returned = proc.communicate()[0].strip()
            text_output = text_returned.decode('utf-8')

        if text_output:
            for region in sel:
                if region.size() == 0:
                    self.view.insert(edit, region.end(), text_output)
                else:
                    self.view.replace(edit, region, text_output)
