defmodule PlugHealthCheck do
  @behaviour Plug
  import Plug.Conn

  @default_methods ~w(GET HEAD)

  def init(opts) do
    if !Keyword.has_key?(opts, :path) do
      raise "No path provided to PlugHealthCheck"
    end

    Keyword.put_new(opts, :methods, @default_methods)
  end

  def call(conn, opts) do
    if conn.request_path == opts[:path] and conn.method in opts[:methods] do
      conn
      |> halt()
      |> send_resp(200, "")
    else
      conn
    end
  end
end
