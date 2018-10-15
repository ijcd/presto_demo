defmodule PrestoDemo.SingleCounterTest do
  use PrestoDemo.FeatureCase, async: true
  import Wallaby.Query

  test "single counter works", %{session: session} do
    session
    |> visit("/")
    |> click(link("single_counter"))
    |> assert_has(css("#counter", text: "Counter is: 0"))
    |> click(button("More"))
    |> assert_has(css("#counter", text: "Counter is: 1"))
    |> click(button("More"))
    |> assert_has(css("#counter", text: "Counter is: 2"))
    |> click(button("Less"))
    |> click(button("Less"))
    |> click(button("Less"))
    |> assert_has(css("#counter", text: "Counter is: -1"))
  end
end
