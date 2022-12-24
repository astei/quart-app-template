from quart import Blueprint


hello_world_ns = Blueprint("Hello World", __name__, url_prefix="/hello-world")


@hello_world_ns.route("/")
async def index():
    return "Hello, world!", 200
