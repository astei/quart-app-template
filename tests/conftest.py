import pytest


@pytest.fixture(scope="session")
def app():
    from piggybank import create_full_app

    yield create_full_app()
