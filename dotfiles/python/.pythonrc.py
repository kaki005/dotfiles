# this file is executed on starting console python.
import readline, rlcompleter
readline.parse_and_bind("tab: complete")
readline.write_history_file = lambda *args: None # disable python history
# pprint
import sys, pprint
def my_displayhook(value):
  if value is not None:
    try:
      import __builtin__
      __builtin__._ = value
    except ImportError:
      __builtins__._ = value
    pprint.pprint(value)
sys.displayhook = my_displayhook
