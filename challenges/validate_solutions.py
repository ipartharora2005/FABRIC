import os
import glob
import psycopg2
import pytest

DB_URL = os.environ.get("DB_URL", "postgresql://playground:playground@localhost:5432/northwind")


def run_sql(filepath):
    conn = psycopg2.connect(DB_URL)
    cur = conn.cursor()
    sql = open(filepath).read()
    # Run only the first statement (before any blank-line-separated bonus queries)
    first_statement = sql.split("\n\n-- PART 2")[0].split("\n\n-- VERSION 2")[0]
    cur.execute(first_statement)
    rows = cur.fetchall()
    conn.close()
    return rows


solution_files = sorted(glob.glob("challenges/**/solution.sql", recursive=True))


@pytest.mark.parametrize("filepath", solution_files)
def test_solution_runs_and_returns_rows(filepath):
    """Each solution must execute without error and return at least 1 row."""
    rows = run_sql(filepath)
    assert rows is not None, f"{filepath} returned None"
    assert len(rows) > 0, f"{filepath} returned 0 rows — check your query"


@pytest.mark.parametrize("filepath", solution_files)
def test_solution_has_matching_challenge(filepath):
    """Every solution.sql must have a corresponding challenge.md."""
    challenge = filepath.replace("solution.sql", "challenge.md")
    assert os.path.exists(challenge), f"Missing challenge.md for {filepath}"
