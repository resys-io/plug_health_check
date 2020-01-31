defmodule PlugHealthCheckTest do
  use ExUnit.Case
  use Plug.Test
  doctest PlugHealthCheck

  defmodule HealthPath do
    use Plug.Router
    plug(PlugHealthCheck, path: "/healthpath")
    plug(:match)
    plug(:dispatch)
    match(_, do: send_resp(conn, 200, "match"))
  end

  defmodule Methods do
    use Plug.Router
    plug(PlugHealthCheck, path: "/health", methods: ~w(POST))
    plug(:match)
    plug(:dispatch)
    match(_, do: send_resp(conn, 200, "match"))
  end

  test "responds with empty body on /healthpath" do
    test_conn = conn(:get, "/healthpath") |> HealthPath.call([])
    assert test_conn.status == 200
    assert test_conn.resp_body == ""

    test_conn = conn(:head, "/healthpath") |> HealthPath.call([])
    assert test_conn.status == 200
    assert test_conn.resp_body == ""
  end

  test "responds normally on other paths" do
    test_conn = conn(:get, "/") |> HealthPath.call([])
    assert test_conn.status == 200
    assert test_conn.resp_body == "match"

    test_conn = conn(:get, "/else") |> HealthPath.call([])
    assert test_conn.status == 200
    assert test_conn.resp_body == "match"
  end

  test "allows custom methods" do
    test_conn = conn(:get, "/health") |> Methods.call([])
    assert test_conn.resp_body == "match"

    test_conn = conn(:post, "/health") |> Methods.call([])
    assert test_conn.resp_body == ""
  end
end
