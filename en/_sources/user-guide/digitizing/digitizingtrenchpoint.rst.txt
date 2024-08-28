.. _digitizing-trench-point:

Digitizing Trench point
=======================

Digitizing
----------

Select the **trench_point** layer in that layer panel and then select the edit mode. Select the **point tool** in the digitizing toolbar.

Now the cursor changes to the digitizing symbol and you can select the location of the new point element.

Then the **trench_point** form opens and you can start adding data :

.. figure:: images/tdh_trench_point_form.jpg

Select the kind of trench-point you want (preselected is 'drainage'):

- drainage
- fixed_point
- geometry_point
- manhole_access
- mounting_opening
- support
- unknown
- venting

Then add the name_number (this is the attribute that will be displayed on the map).

.. note:: If you do not enter an identifier, TDH will enter the obj_id also as identifier (you can change later). 

Add other mandatory attributes.
You can also add attributes in the other sections (Ground observations, Organisations, etc.).

.. note:: The idea of the head of the form is, that in the normal digitizing process (95% of the trench_point) the user has not to change the attributes that are necessary in the other sections.

Click **OK** to close the form.

Save the information of this layer by selecting the Floppy icon in the menu bar.

You can re-edit your polygon object selecting the edit mode and then click with the info cursor on the object you want to edit.
If you do not select the edit mode, you can just look at the existing data.

For detailed information about editing see the :ref:`editing-data` chapter.
