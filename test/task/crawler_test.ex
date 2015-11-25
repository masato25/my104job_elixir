defmodule CrawlerTest do
  use ExUnit.Case, async: false

  # setup do
  #   resp = HTTPotion.get("http://www.104.com.tw/i/apis/jobsearch.cfm?cat=2007001000&sltp=S&slmin=50000&slmax=150000&fmt=8&page=1&pgsz=1")
  # end

  test "get" do
    resp = MainCrawler.new("http://www.104.com.tw/i/apis/jobsearch.cfm?cat=2007001000&sltp=S&slmin=50000&slmax=150000&fmt=8&page=1&pgsz=1")
    assert resp.get != nil
  end

end
