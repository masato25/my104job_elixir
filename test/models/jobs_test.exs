defmodule My104jobs.JobsTest do
  use My104jobs.ModelCase

  alias My104jobs.Jobs

  @valid_attrs %{area: "some content", c: "some content", company_name: "some content", create_at: "14:00:00", j: "some content", job_cat: "some content", job_name: "some content", sal_high: 42, sal_low: 42, welfare: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Jobs.changeset(%Jobs{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Jobs.changeset(%Jobs{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "the same c" do
    test2 = @valid_attrs
    changeset = Jobs.changeset(%Jobs{}, @invalid_attrs)
    changeset.changes
    changeset = Jobs.changeset(%Jobs{}, test2)
    assert changeset.valid? == false
  end
end
