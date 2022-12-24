from quart import Quart


def create_base_app() -> Quart:
    app = Quart(__name__)
    return app


def create_full_app() -> Quart:
    app = create_base_app()

    from .api import public_api_ns
    from .components.hello_world.routes import hello_world_ns

    public_api_ns.register_blueprint(hello_world_ns)
    app.register_blueprint(public_api_ns)

    return app
