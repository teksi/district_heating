Digitizing Pipe Points
======================

General
-------

TDH has no wizard to correctly build pipe_points (normal or feed).


Digitizing pipe_point_normal
----------------------------
* Make sure that the automatic snapping tool is activated for all layers.

* Select the vw_pipe_point_normal layer in that layer panel and then select the edit mode.

* In digitizing mode the cursor will automatically snap to the nearest object in the map canvas.
  When left clicking a point is created at the selected cursor position.

* This will make the **vw_pipe_point_normal** feature attributes window appear and you can start adding data:

.. figure:: images/tdh_pipe_point_normal_form.JPG

Select the kind of the pipe_point_normal you want (preselected is 'NULL') in the dropdown list:

- armatures.valve_without_motor
- armatures.emptying
- armatures.venting
- armatures.shaped_piece.reduction
- armatures.shaped_piece.t_piece
- armatures.installations.condenser
- armatures.pipe_point.geometry_point
- armatures.pipe_point.change_of_material
- armatures.pipe_point.sleeve

Add other mandatory attributes.
You can also add attributes in the other sections (Ground observations, Characteristics, Organisations, etc.).


* When finished, then click the **OK** button.

* Save the information of this layer by selecting the Floppy icon in the menu bar.

You can re-edit your point object selecting the edit mode and then click with the info cursor on the object you want to edit.

Digitizing pipe_point_feed
----------------------------
* Make sure that the automatic snapping tool is activated for all layers.

* Select the vw_pipe_point_feed layer in that layer panel and then select the edit mode.

* In digitizing mode the cursor will automatically snap to the nearest object in the map canvas.
  When left clicking a point is created at the selected cursor position.

* This will make the **vw_pipe_point_feed** feature attributes window appear and you can start adding data:

.. figure:: images/tdh_pipe_point_feed_form.JPG

Select the kind of the pipe_point_feed you want (preselected is 'NULL') in the dropdown list:

- network_supply
- network_interconnection
- network_transfer_station
- others

Add other mandatory attributes.
You can also add attributes in the other sections (Ground observations, Characteristics, Organisations, etc.).


* When finished, then click the **OK** button.

* Save the information of this layer by selecting the Floppy icon in the menu bar.

You can re-edit your point object selecting the edit mode and then click with the info cursor on the object you want to edit.
If you do not select the edit mode, you can just look at the existing data.

For detailed information about editing see the :ref:`editing-data` chapter.
