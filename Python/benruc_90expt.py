#!/usr/bin/env python
#
##############################################################################
#
# MODULE:       model
#
# AUTHOR(S):    u4cnnwrf
#
# PURPOSE:      Script generated by wxGUI Graphical Modeler.
#
# DATE:         Tue Sep 04 08:07:38 2018
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

def main():
    run_command("v.db.addcolumn",
                map = "benruc_65r90_5@report",
                layer = "1",
                columns = "east double precision,north double precision")

    run_command("v.to.db",
                map = "benruc_65r90_5@report",
                layer = "1",
                type = "point,line,boundary,centroid",
                option = "coor",
                columns = "cat,area",
                query_layer = "1",
                separator = "pipe")

    run_command("v.to.points",
                input = "benruc_65r90_5@report",
                layer = "1",
                type = "point,line,boundary,centroid,face",
                output = "benruc_65r90_p",
                dmax = 100)


    return 0

if __name__ == "__main__":
    options, flags = parser()
    atexit.register(cleanup)
    sys.exit(main())
