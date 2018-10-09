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
# DATE:         Tue Oct 09 06:46:17 2018
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
  
    run_command("g.region",
                vector = "hlcrslo_65r@report")
# 43  
    run_command("v.overlay",
                ainput = "hlcrslo_65r_pad@report",
                alayer = "1",
                atype = "auto",
                binput = "hlcrslo_65r_43@report",
                blayer = "1",
                btype = "area",
                operator = "or",
                output = "hlcrslo_pad43",
                olayer = "1,0,0",
                snap = 1e-8)

    run_command("v.db.addcolumn",
                map = "hlcrslo_pad43",
                layer = "1",
                columns = "subarea double precision")

    run_command("v.to.db",
                map = "hlcrslo_pad43",
                layer = "1",
                type = "point,line,boundary,centroid",
                option = "area",
                columns = "subarea",
                query_layer = "1",
                separator = "pipe")


# 52  
    run_command("v.overlay",
                ainput = "hlcrslo_65r_pad@report",
                alayer = "1",
                atype = "auto",
                binput = "hlcrslo_65r_52@report",
                blayer = "1",
                btype = "area",
                operator = "or",
                output = "hlcrslo_pad52",
                olayer = "1,0,0",
                snap = 1e-8)

    run_command("v.db.addcolumn",
                map = "hlcrslo_pad52",
                layer = "1",
                columns = "subarea double precision")

    run_command("v.to.db",
                map = "hlcrslo_pad52",
                layer = "1",
                type = "point,line,boundary,centroid",
                option = "area",
                columns = "subarea",
                query_layer = "1",
                separator = "pipe")

# 71  
    run_command("v.overlay",
                ainput = "hlcrslo_65r_pad@report",
                alayer = "1",
                atype = "auto",
                binput = "hlcrslo_65r_71@report",
                blayer = "1",
                btype = "area",
                operator = "or",
                output = "hlcrslo_pad71",
                olayer = "1,0,0",
                snap = 1e-8)

    run_command("v.db.addcolumn",
                map = "hlcrslo_pad71",
                layer = "1",
                columns = "subarea double precision")

    run_command("v.to.db",
                map = "hlcrslo_pad71",
                layer = "1",
                type = "point,line,boundary,centroid",
                option = "area",
                columns = "subarea",
                query_layer = "1",
                separator = "pipe")



    return 0

if __name__ == "__main__":
    options, flags = parser()
    atexit.register(cleanup)
    sys.exit(main())
