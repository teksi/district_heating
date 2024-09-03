.. _digitizing-cable-point:

Digitizing cable point
=======================

General
-------

TDH includes the SIA-405 extension in order to allow cables and cable_points to be digitized.

Digitizing
----------

Select the **sia405cc_cable_point** layer in that layer panel and then select the edit mode. Select the **point tool** in the digitizing toolbar.

Now the cursor changes to the digitizing symbol and you can select the location of the new point element.

Then the **sia405cc_cable_point** form opens and you can start adding data :

.. figure:: images/tdh_sia405cc_cable_point_form.jpg

Select the kind of cable point you want (preselected is 'cabine'):

- cabine
- cable_manhole
- cable_point
- cable_sleeve
- others
- unknown

Then add the name_number (this is the attribute that will be displayed on the map).

.. note:: If you do not enter an identifier, TDH will enter the obj_id also as identifier (you can change later).

Add other mandatory attributes.
You can also add attributes in the other sections (Ground observations, Organisations, etc.).

.. note:: The idea of the head of the form is, that in the normal digitizing process (95% of the cable_point) the user has not to change the attributes that are necessary in the other sections.

Click **OK** to close the form.

Save the information of this layer by selecting the Floppy icon in the menu bar.

You can re-edit your polygon object selecting the edit mode and then click with the info cursor on the object you want to edit.
If you do not select the edit mode, you can just look at the existing data.

For detailed information about editing see the :ref:`editing-data` chapter.
