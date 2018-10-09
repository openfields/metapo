#!/usr/bin/env python
#
##############################################################################
#
# MODULE:       model
#
# AUTHOR(S):    Will Fields
#
# PURPOSE:      Delineates habitat networks for McCoy
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
                vector = 'mccoy_65r')

  run_command("r.mask",
                maskcats = "*",
                vector = 'mccoy_65r',
                layer = "1")

# # mapcalcs for habitat networks from rasters
  run_command("r.mapcalc",
                expression = 'mccoy_65r' + "_tmpvd=if(us_140vdep<67,1,null())",
                overwrite = True)
# #  
  run_command("r.mapcalc",
                 expression = 'mccoy_65r' + "_tmp41424390=if(nlcd_2011v14@PERMANENT==41 || nlcd_2011v14@PERMANENT==42 || nlcd_2011v14@PERMANENT==43 || nlcd_2011v14@PERMANENT==90,1,null())",
                 overwrite = True)

  run_command("r.mapcalc",
                expression = 'mccoy_65r' + "_tmp43=if(nlcd_2011v14@PERMANENT==43,1,null())",
                overwrite = True)
                
  run_command("r.mapcalc",
                expression = 'mccoy_65r' + "_tmp71=if(nlcd_2011v14@PERMANENT==71,1,null())",
                overwrite = True)

# multiply vdep & nlcd
  run_command("r.mapcalc",
                expression = 'mccoy_65r' + "_41424390=" + 'mccoy_65r' + "_tmpvd * " + 'mccoy_65r' + "_tmp41424390",
                overwrite = True)
                
  run_command("r.mapcalc",
                expression = 'mccoy_65r' + "_43=" + 'mccoy_65r' + "_tmpvd * " + 'mccoy_65r' + "_tmp43",
                overwrite = True)
                
  run_command("r.mapcalc",
                expression = 'mccoy_65r' + "_71=" + 'mccoy_65r' + "_tmpvd * " + 'mccoy_65r' + "_tmp71",
                overwrite = True)


# write data to vector       
  run_command("r.to.vect",
                input = 'mccoy_65r_41424390',
                output = 'mccoy_65r_41424390',
                type= "area")         

  run_command("r.to.vect",
                input = 'mccoy_65r_43',
                output = 'mccoy_65r_43',
                type= "area")         

  run_command("r.to.vect",
                input = 'mccoy_65r_71',
                output = 'mccoy_65r_71',
                type= "area")         

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
