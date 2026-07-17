Here come the datamodel files for the module TEKSI Distance heating

![TEKSI Distant heating drawio](https://github.com/teksi/district_heating/assets/1265865/8dde2f45-4fb1-45b6-b5b0-91d43c092e99)

This is an class diagramm based on the information from the INTERLIS files German, French and the translation made for TEKSI district heating.

Notes:

- In class trench (Trace / Trasse) there is an attribut geometrie within the class plus extra` trace_surface` and `trace_ligne`
- In contradiction in structure (ouvrage / Bauwerk) the geometry attributes are only in the extra classe `structure_surface` and `structure_ligne`
- It looks like this is a modelling error in INTERLIS with class trench
- I suggest to start with implementing:

- [x] geometry3D as surface for classes trench and ouvrage in TEKSI Distant heating
