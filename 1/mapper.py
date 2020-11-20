#!/usr/bin/python

import sys

for line in sys.stdin:
	line = line.strip()
	user_id, item_id, rating, timestamp = line.split()
	print '%s\t%s' % (item_id, 1)
