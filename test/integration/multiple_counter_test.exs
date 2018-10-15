defmodule PrestoDemo.MultipleCounterTest do
  use PrestoDemo.FeatureCase, async: true
  import Wallaby.Query

  def assert_counts(session, counts) do
    actual =
      session
      |> find(css("#counter", count: length(counts)))
      |> Enum.map(&Element.text/1)

    assert actual == Enum.map(counts, &"Counter is: #{&1}")
    session
  end

  test "multiple counter works", %{session: session} do
    session
    |> visit("/")
    |> click(link("multiple_counter"))
    |> assert_counts([0, 0, 0])
    |> click(css("#one button#inc"))
    |> assert_counts([1, 0, 0])
    |> click(css("#two button#inc"))
    |> click(css("#two button#inc"))
    |> assert_counts([1, 2, 0])
    |> click(css("#three button#dec"))
    |> assert_counts([1, 2, -1])
  end
end
