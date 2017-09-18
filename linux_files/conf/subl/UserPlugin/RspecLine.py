import sublime
import sublime_plugin


class RspecLineCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        line_number = self.view.rowcol(self.view.sel()[0].begin())[0] + 1
        project_hash = self.view.window().extract_variables()
        shell_cmd = 'bundle exec rspec {0}:{1}'.format(project_hash['file'], line_number)

        command_hash = {
            'shell_cmd': shell_cmd,
            'working_dir': project_hash['folder']
        }

        self.view.window().run_command('exec', command_hash)
