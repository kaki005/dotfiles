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


## common standard library imports
print('')
from datetime import datetime as dt
pprint.pprint('from datetime import datetime as dt')
import sys, os, glob, re, subprocess, json, datetime, random, time
pprint.pprint('import sys, os, glob, re, subprocess, json, datetime, random, time')
from collections import namedtuple, defaultdict, Counter
pprint.pprint('from collections import namedtuple, defaultdict, Counter')
from itertools import product
pprint.pprint('from itertools import product')
from math import *
pprint.pprint('from math import *')

## common pip imports
print('')
try:
    from dateutil.parser import parse
    pprint.pprint('from dateutil.parser import parse')
except:
    pprint.pprint('dateutil not available!')
try:
    import numpy as np
    pprint.pprint('import numpy as np')
except:
    pprint.pprint('numpy not available!')
try:
    import warnings
    with warnings.catch_warnings():
        warnings.simplefilter("ignore")
        import matplotlib.pyplot as plt
        pprint.pprint('import matplotlib.pyplot as plt')
except:
    pprint.pprint('matplotlib not available!')
