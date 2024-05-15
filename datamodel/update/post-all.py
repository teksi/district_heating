#!/usr/bin/env python3


try:
    pass
except ImportError:
    pass

from pum.core.deltapy import DeltaPy
from view.create_views import create_views

# sys.path.append(os.path.join(os.path.dirname(__file__), ".."))


class CreateViews(DeltaPy):
    def run(self):
        # tdh_wastewater_structure_extra = self.variables.get("tdh_wastewater_structure_extra", None)
        # tdh_reach_extra = self.variables.get("tdh_reach_extra", None)

        if not self.variables.get("SRID"):
            raise RuntimeError(
                "SRID not specified. Add `-v int SRID 2056` (or the corresponding EPSG code) to the upgrade command."
            )
        create_views(
            srid=self.variables.get("SRID"),
            pg_service=self.pg_service,
            # tdh_wastewater_structure_extra=tdh_wastewater_structure_extra,
            # tdh_reach_extra=tdh_reach_extra,
        )

        # refresh network views - not needed at the moment for Distance heating
        # conn = psycopg.connect(f"service={self.pg_service}")
        # cursor = conn.cursor()
        # cursor.execute("SELECT tdh_app.network_refresh_network_simple();")
        # conn.commit()
        # conn.close()
