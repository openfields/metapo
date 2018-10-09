#!/usr/bin/env python
#
##############################################################################
#
# MODULE:       model
#
# AUTHOR(S):    Will Fields
#
# PURPOSE:      Delineates habitat networks for Dugway Proving Ground
#
# DATE:         Tue Sep 11, 2018
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
# Set region & mask
  run_command("g.region",
                vector = 'cwdp_65r')

  run_command("r.mask",
                maskcats = "*",
                vector = 'cwdp_65r',
                layer = "1")

# # mapcalcs for habitat networks from rasters
  run_command("r.mapcalc",
                expression = 'cwdp_65r' + "_tmpvd=if(us_140vdep<67,1,null())",
                overwrite = True)
#  
  run_command("r.mapcalc",
                expression = 'cwdp_65r' + "_tmp52=if(nlcd_2011v14@PERMANENT==52,1,null())",
                overwrite = True)


# multiply vdep & nlcd
  run_command("r.mapcalc",
                expression = 'cwdp_65r' + "_52=" + 'cwdp_65r' + "_tmpvd * " + 'cwdp_65r' + "_tmp52",
                overwrite = True)


# write data to vector       
  run_command("r.to.vect",
                input = 'cwdp_65r_52',
                output = 'cwdp_65r_52',
                type= "area",
                overwrite = True)         


# remove raster mask
  run_command("r.mask",
                flags = 'r',
                maskcats = "*",
                layer = "1")

  return 0

if __name__ == "__main__":
    options, flags = parser()
    atexit.register(cleanup)
    sys.exit(main())