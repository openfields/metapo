#!/usr/bin/env python
#
##############################################################################
#
# MODULE:       model
#
# AUTHOR(S):    Will Fields
#
# PURPOSE:      Delineates habitat networks for Ravenna
#
# DATE:         Wed Sep 12, 2018
#
##############################################################################

#%module
#% description: Script generated by wxGUI Graphical Modeler.
#%end
# atterbury, dawson, campbell, drum, knox, flwo, macon, west
import sys
import os
import atexit

from grass.script import parser, run_command

def cleanup():
    pass
# 
def main():
# Set region & mask: knox
  run_command("g.region",
                vector = 'knox_65r')

  run_command("r.mask",
                maskcats = "*",
                vector = 'knox_65r',
                layer = "1")

# # mapcalcs for habitat networks from rasters
#   run_command("r.mapcalc",
#                 expression = 'catt_65r' + "_tmpvd=if(us_140vdep<67,1,null())",
#                 overwrite = True)
# #  
  run_command("r.mapcalc",
                 expression = 'knox_65r' + "_tmp414390=if(nlcd_2011v14@PERMANENT==41 || nlcd_2011v14@PERMANENT==43 || nlcd_2011v14@PERMANENT==90,1,null())",
                 overwrite = True)


# multiply vdep & nlcd
  run_command("r.mapcalc",
                expression = 'knox_65r' + "_414390=" + 'knox_65r' + "_tmpvd * " + 'knox_65r' + "_tmp414390",
                overwrite = True)
                

# write data to vector       
  run_command("r.to.vect",
                input = 'knox_65r_414390',
                output = 'knox_65r_414390',
                type= "area",
                overwrite = True)         


# remove raster mask
  run_command("r.mask",
                flags = 'r',
                maskcats = "*",
                layer = "1")

# Set region & mask: leonard wood

  run_command("g.region",
                vector = 'flwo_65r')

  run_command("r.mask",
                maskcats = "*",
                vector = 'flwo_65r',
                layer = "1")

# # mapcalcs for habitat networks from rasters
#   run_command("r.mapcalc",
#                 expression = 'catt_65r' + "_tmpvd=if(us_140vdep<67,1,null())",
#                 overwrite = True)
# #  
  run_command("r.mapcalc",
                 expression = 'flwo_65r' + "_tmp414390=if(nlcd_2011v14@PERMANENT==41 || nlcd_2011v14@PERMANENT==43 || nlcd_2011v14@PERMANENT==90,1,null())",
                 overwrite = True)


# multiply vdep & nlcd
  run_command("r.mapcalc",
                expression = 'flwo_65r' + "_414390=" + 'flwo_65r' + "_tmpvd * " + 'flwo_65r' + "_tmp414390",
                overwrite = True)
                

# write data to vector       
  run_command("r.to.vect",
                input = 'flwo_65r_414390',
                output = 'flwo_65r_414390',
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
