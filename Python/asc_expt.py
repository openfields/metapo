#!/usr/bin/env python
#
##############################################################################
#
# MODULE:       model
#
# AUTHOR(S):    Will Fields
#
# PURPOSE:      Export ascii data
#
# DATE:         Tue Aug 10, 2018
#
##############################################################################

#%module
#% description: Script generated by wxGUI Graphical Modeler.
#%end

import sys
import os
import atexit

from grass.script import parser, run_command

def cleanup():
    pass
# 
def main():

  run_command("v.out.ascii",
              input="",
              flags="c",
              type="centroid",
              columns="cat,area", 
              format="standard",
              separator="comma",
              output="C:/Users/u4cnnwrf/Documents/test.csv")

  return 0

if __name__ == "__main__":
    options, flags = parser()
    atexit.register(cleanup)
    sys.exit(main())

#v.out.ascii -c input=<required> type=centroid columns=cat,area format=standard separator=comma
