# defmodule PrestoDemo.UserListTest do
#   use PrestoDemo.FeatureCase, async: true

#   import Wallaby.Query, only: [css: 2]

#   test "users have names", %{session: session} do
#     session
#     |> visit("/users")
#     |> find(css(".user", count: 3))
#     |> List.first()
#     |> assert_has(css(".user-name", text: "Chris"))
#   end
# end
