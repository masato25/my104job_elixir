defmodule Crawler.InsertToDB do
  alias My104jobs.Jobs
  alias My104jobs.Repo

  def create(obj) do
    records = getvalue(obj)
    job = Jobs.changeset(%Jobs{},records)
    if job.valid? do
      Repo.insert(job)
    end
  end

  def getdate(create_at) do
    d = String.to_char_list(create_at)
    year = Enum.slice(d, 0,4)
    year = String.to_integer(to_string year)
    month = Enum.slice(d, 4,2)
    month = String.to_integer(to_string month)
    day = Enum.slice(d, 6,2)
    day = String.to_integer(to_string day)
    hour = Enum.slice(d, 8,2)
    hour = String.to_integer(to_string hour)
    minutes = Enum.slice(d, 10,2)
    minutes = String.to_integer(to_string minutes)
    seconds = Enum.slice(d, 10,2)
    seconds = String.to_integer(to_string seconds)
    dd = %Ecto.DateTime{year: year,month: month, day: day,hour: hour, min: minutes, sec: seconds}
    Ecto.DateTime.to_date(dd)
  end

  def getvalue(obj) do
    # %{area: "some content", c: "some content", company_name: "some content", create_at: "14:00:00", j: "some content", job_cat: "some content", job_name: "some content", sal_high: 42, sal_low: 42, welfare: "some content"}
    area = obj["ADDR_NO_DESCRIPT"]
    c = obj["C"]
    company_name = obj["NAME"]
    create_at = getdate(obj["APPEAR_TIME"])
    j = obj["J"]
    job_cat = obj["JOBCAT_DESCRIPT"]
    job_name = obj["JOB"]
    sal_high = String.to_integer(obj["SAL_MONTH_HIGH"])
    sal_low = String.to_integer(obj["SAL_MONTH_LOW"])
    welfare = obj["WELFARE"]
    %{area: area, c: c, company_name: company_name, create_at: create_at, j: j, job_cat: job_cat, job_name: job_name, sal_high: sal_high, sal_low: sal_low, welfare: welfare}
  end

end
