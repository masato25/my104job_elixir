defmodule Crawler.CrawlerController do
  alias Crawler.MainCrawler
  alias Crawler.InsertToDB

  def getnext(pid) do
    d = MainCrawler.nextpage(pid)
    if d != [] do
      d |> Enum.map(&InsertToDB.create(&1))
      getnext(pid)
    else
      IO.puts("jobs finished")
    end
  end

  def getdata() do
    {:ok, pid} = MainCrawler.new
    o = MainCrawler.get(pid) |> Enum.map(&InsertToDB.create(&1))
    getnext(pid)
  end

end
