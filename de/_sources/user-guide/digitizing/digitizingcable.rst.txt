Digitizing Cables
=================

General
-------

TDH includes the SIA-405 extension in order to allow cables and cable_points to be digitized.


Digitizing
----------
* Make sure that the automatic snapping tool is activated for all layers.

* Select the **sia4005cc_cable** layer in that layer panel and then select the edit mode.

* In digitizing mode the cursor will automatically snap to the nearest map objects.
  When left clicking a line starts to draw.


* With further left clicks anywhere you can define intermediary points of the cable progression.
  You can also directly select another soa405cc_cable_point to draw a straight line.

* You finish digitizing the line by right clicking. This will make the **sia4005cc_cable** feature attributes window appear and you can start adding data:

.. figure:: images/tdh_sia4005cc_cable_form.jpg

Select the function of the sia4005cc_cable you want (preselected is 'control_cable'):

- control_cable
- others
- power_cable
- signal_cable
- unkown

.. note:: Keep in mind that the finishing point of the line is the last point where you **left** clicked.
  Thus, for digitizing a simple line with 2 points you need two **left clicks** to digitize the line and one
  **right click** to finish the line digitizing.

.. note:: If you do not enter an `name_number` identifier on this form, TDH will enter the `obj_id` also as identifier (you can change later).

* When finished, then click the **OK** button.

* Save the information of this layer by selecting the Floppy icon in the menu bar.

You can re-edit your polygon object selecting the edit mode and then click with the info cursor on the object you want to edit.
If you do not select the edit mode, you can just look at the existing data.

For detailed information about editing see the :ref:`editing-data` chapter.
