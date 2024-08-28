Data entry
==========

There are basically two ways:

* Data entry by constructing or digitizing in a TDH-project with the QGIS-tools itself
* Data entry in an external program or software and then importing the position and/or technical data into TDH e.g.:

   * coordinates from manholes from measurement
   * position and/or technical data from another GIS or CAD system
   * using data from the surveyor (e.g. property boundaries) as a basis for defining catchment borders
   * other

Data entry in TDH needs some understanding of the underlying data model `SIA 405`_, but is supported with forms that link the different tables correctly together.


QGIS standard tools
-------------------

To digitize th network elements, you need to work with the standard QGIS tools:

* Select the layer you want to edit
* Toggle Editing if necessary
* Enable snapping if necessary
* Choose the add feature tool
