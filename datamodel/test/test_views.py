import decimal
import os
import unittest

try:
    import psycopg
except ImportError:
    import psycopg2 as psycopg

from .utils import DEFAULT_PG_SERVICE, DbTestBase


class TestViews(unittest.TestCase, DbTestBase):
    @classmethod
    def tearDownClass(cls):
        cls.conn.rollback()

    @classmethod
    def setUpClass(cls):
        pgservice = os.environ.get("PGSERVICE") or DEFAULT_PG_SERVICE
        cls.conn = psycopg.connect(f"service={pgservice}")

    def test_vw_tdh_pipe_point(self):
        row = {
            "remark": "no remark",
            "elevation_determination": 8100,
            "pp_type": "pipe_point_normal",
            "altitude1": decimal.Decimal("450.015"), # numeric 7,3
            "geometry3d_geometry": self.execute(
                "ST_SetSRID(ST_GeomFromText('POINTZ(2600000 1200000 450.015)'), 2056)"
            ),
        }

        obj_id = self.insert_check("vw_tdh_pipe_point", row)

        row = {
            "remark": "remark added",
            "elevation_determination": 8101,
            "altitude1": decimal.Decimal("450.016"), # numeric 7,3
        }

        self.update_check("vw_tdh_pipe_point", row, obj_id)


if __name__ == "__main__":
    unittest.main()
