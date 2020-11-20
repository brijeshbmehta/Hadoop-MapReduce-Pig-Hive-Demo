#!/usr/bin/python

import sys

for line in sys.stdin:
	line = line.strip()
	no_of_user, ignore, item_id = line.split('\t')
	print '%s\t%s' % (no_of_user, 1)
