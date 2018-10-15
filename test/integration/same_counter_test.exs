defmodule PrestoDemo.SameCounterTest do
  use PrestoDemo.FeatureCase, async: true
  use Retry
  import Wallaby.Query

  def assert_counts(session, counts) do
    actual =
      session
      |> find(css("#counter", count: length(counts)))
      |> Enum.map(&Element.text/1)

    assert actual == Enum.map(counts, &"Counter is: #{&1}")
    session
  end

  test "same counter works", %{session: session} do
    session
    |> visit("/")
    |> click(link("same_counter"))
    |> assert_counts([0, 0])
    |> click(css("#one button#inc"))
    |> assert_counts([1, 1])
    |> click(css("#two button#inc"))
    |> click(css("#two button#inc"))
    |> assert_counts([3, 3])
    |> click(css("#one button#dec"))
    |> click(css("#one button#dec"))
    |> click(css("#two button#dec"))
    |> click(css("#two button#dec"))
    |> assert_counts([-1, -1])
  end
end
