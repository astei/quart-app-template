import pytest
from quart import Quart


@pytest.mark.asyncio
async def test_ensure_hello_world_is_printed(app: Quart):
    test_client = app.test_client()
    response = await test_client.get("/v1/hello-world/")
    assert response.status_code == 200
    result = await response.get_data()
    assert result == b"Hello, world!"
