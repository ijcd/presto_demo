defmodule PrestoDemoWeb.Presto.RootSingleCounter do
  use Presto.Page
  use Taggart.HTML
  require Logger

  @impl Presto.Page
  def initial_model(_model) do
    0
  end

  @impl Presto.Page
  def update(message, model) do
    IO.inspect(message, label: "MESSAGE")

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

  @impl Presto.Page
  def render(model) do
    div(class: "presto-component", id: "presto-component-12345") do
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
