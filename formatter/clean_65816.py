import sys
import re

def clean_65816(filename):
	with open(filename, 'r') as f:
		for line in f:
			r = re.compile(r'')
			m = r.match(line)
			if m:
				