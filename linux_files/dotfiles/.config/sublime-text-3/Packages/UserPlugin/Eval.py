import sublime
import sublime_plugin


class EvalCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        view = self.view

        selected_text = view.substr(view.sel()[0])
        line_text = view.substr(view.line(view.sel()[0]))

        if len(selected_text) > 0:
            self.send(selected_text)
        elif len(line_text) > 0:
            self.send(line_text)

    def send(self, text):
        self.view.window().run_command('terminal_view_send_string', {'string': text + '\n'})
