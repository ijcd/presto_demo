defmodule PrestoDemoWeb.Presto.CounterComponent do
  require Logger
  use Taggart.HTML

  def initial_model(model \\ 0) do
    model
  end

  def update(message, model) do
    case message do
      %{"event" => "click", "id" => "inc"} ->
        model + 1

      %{"event" => "click", "id" => "dec"} ->
        model - 1

      _ ->
        Logger.warn("Unknown message: #{inspect(message)}")
        model
    end
  end

  def render(model) do
    div do
      "Counter is: #{inspect(model)}"

      button(id: "inc", class: "presto-click") do
        "More"
      end

      button(id: "dec", class: "presto-click") do
        "Less"
      end
    end
  end
end
