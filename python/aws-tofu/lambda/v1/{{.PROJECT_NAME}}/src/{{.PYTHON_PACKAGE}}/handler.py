"""Lambda handler for {{.PROJECT_NAME}}."""

from typing import Any


def handler(event: dict[str, Any], context: Any) -> dict[str, Any]:
    """Handle a Lambda invocation.

    Returns an API-Gateway-proxy-style response so the function works
    behind API Gateway and from a direct test invoke alike.
    """
    name = event.get("name", "world")
    return {"statusCode": 200, "body": f"hello, {name}"}
