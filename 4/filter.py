#!/usr/bin/python

import sys

for line in sys.stdin:
	line = line.strip()
	movie_id, rating = line.split('\t')
	print '%s\t\t\t\t%s' % (movie_id, rating)
