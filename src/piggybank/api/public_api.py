from quart import Blueprint


public_api_ns = Blueprint("public", __name__, url_prefix="/v1/")
