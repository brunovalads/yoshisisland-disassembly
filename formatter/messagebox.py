import sys
import re

def poopy_dick(filename, data_format, break_on):
	bytes = []
	addrs = []
	bank = '$00/'
	with open(filename, 'r') as f:
		for line in f:
			r = re.compile