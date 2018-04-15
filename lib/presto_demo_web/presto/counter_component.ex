# defmodule PrestoDemoWeb.Presto.CounterComponent do
#   require Logger
#
#   def initial_model(model \\ 0) do
#     model
#   end
#
#   def update(message, model) do
#     IO.inspect(message, label: "MESSAGE")
#
#     case message do
#       %{"event" => "click", "id" => "inc"} ->
#         model + 1
#
#       %{"event" => "click", "id" => "dec"} ->
#         model - 1
#
#       _ ->
#         Logger.warn("Unknown message: #{inspect(message)}")
#         model
#     end
#   end
#
#   def counter(component_id, model) do
#     div(class: "presto-component", id: "presto-component-#{component_id}") do
#       "Counter is: #{inspect(model)}"
#
#       button(id: "inc", class: "presto-click") do
#         "More"
#       end
#
#       button(id: "dec", class: "presto-click") do
#         "Less"
#       end
#     end
#   end
# end
