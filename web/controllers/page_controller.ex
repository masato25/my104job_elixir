defmodule My104jobs.PageController do
  use My104jobs.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
