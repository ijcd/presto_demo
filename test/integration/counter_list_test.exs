defmodule PrestoDemo.CounterListTest do
  use PrestoDemo.FeatureCase, async: true
  import Wallaby.Query

  def assert_counts(session, counts) do
    actual =
      session
      |> find(css("#counter", count: length(counts)))
      |> case do
        es when is_list(es) -> Enum.map(es, &Element.text/1)
        e -> [Element.text(e)]
      end

    assert actual == Enum.map(counts, &"Counter is: #{&1}")
    session
  end

  test "counter list works", %{session: session} do
    session
    |> visit("/")
    |> click(link("counter_list"))
    |> assert_counts([])
    |> click(button('Add'))
    |> assert_counts([0])
    |> click(button('Add'))
    |> assert_counts([0, 0])
    |> click(css("#c1 button#inc"))
    |> assert_counts([1, 0])
    |> click(css("#c1 button#inc"))
    |> assert_counts([2, 0])
    |> click(css("#c2 button#inc"))
    |> assert_counts([2, 1])
    |> click(button('Add'))
    |> assert_counts([2, 1, 0])
    |> click(css("#c3 button#dec"))
    |> assert_counts([2, 1, -1])
    |> click(button('Remove'))
    |> assert_counts([2, 1])
    |> click(button('Remove'))
    |> assert_counts([2])
  end
end
