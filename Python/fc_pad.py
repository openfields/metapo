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
                vector = "fc_65r@report")
# 414390  
    run_command("v.overlay",
                ainput = "fc_65r_pad@report",
                alayer = "1",
                atype = "auto",
                binput = "fc_65r_414390@report",
                blayer = "1",
                btype = "area",
                operator = "or",
                output = "fc_pad414390",
                olayer = "1,0,0",
                snap = 1e-8)

    run_command("v.db.addcolumn",
                map = "fc_pad414390",
                layer = "1",
                columns = "subarea double precision")

    run_command("v.to.db",
                map = "fc_pad414390",
                layer = "1",
                type = "point,line,boundary,centroid",
                option = "area",
                columns = "subarea",
                query_layer = "1",
                separator = "pipe")
# 41424390
    run_command("v.overlay",
                ainput = "fc_65r_pad@report",
                alayer = "1",
                atype = "auto",
                binput = "fc_65r_41424390@report",
                blayer = "1",
                btype = "area",
                operator = "or",
                output = "fc_pad41424390",
                olayer = "1,0,0",
                snap = 1e-8)

    run_command("v.db.addcolumn",
                map = "fc_pad41424390",
                layer = "1",
                columns = "subarea double precision")

    run_command("v.to.db",
                map = "fc_pad41424390",
                layer = "1",
                type = "point,line,boundary,centroid",
                option = "area",
                columns = "subarea",
                query_layer = "1",
                separator = "pipe")
                
# 43

    run_command("r.mask",
                maskcats = "*",
                vector = 'fc_65r',
                layer = "1")

 # mapcalcs for habitat networks from rasters
  
    run_command("r.mapcalc",
                expression = 'fc_65r' + "_tmp43=if(nlcd_2011v14@PERMANENT==43,1,null())",
                overwrite = True)

  # multiply vdep & nlcd

    run_command("r.mapcalc",
                expression = 'fc_65r' + "_43=" + 'fc_65r' + "_tmpvd * " + 'fc_65r' + "_tmp43",
                overwrite = True)

  # write data to vector       
    run_command("r.to.vect",
                input = 'fc_65r_43',
                output = 'fc_65r_43',
                type= "area",
                overwrite = True)         

  # remove raster mask
    run_command("r.mask",
                flags = 'r',
                maskcats = "*",
                layer = "1")

    run_command("v.overlay",
                ainput = "fc_65r_pad@report",
                alayer = "1",
                atype = "auto",
                binput = "fc_65r_43@report",
                blayer = "1",
                btype = "area",
                operator = "or",
                output = "fc_pad43",
                olayer = "1,0,0",
                snap = 1e-8)

    run_command("v.db.addcolumn",
                map = "fc_pad43",
                layer = "1",
                columns = "subarea double precision")

    run_command("v.to.db",
                map = "fc_pad43",
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
