
from visidata import BaseSheet, vd
'''This plugin adds the ``hello-world`` command to all sheets.
Press ``0`` to show display options.disp_hello on the status line.'''

__author__ = 'Jo Baz <jobaz@example.com>'

vd.option('disp_hello', 'Hello world!', 'string to display for hello-world command')

BaseSheet.addCommand('0', 'hello-world', 'status(options.disp_hello)')
