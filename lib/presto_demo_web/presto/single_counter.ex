defmodule PrestoDemoWeb.Presto.SingleCounter do
  use Presto.Page
  use Taggart.HTML
  require Logger

  @impl Presto.Page
  def initial_model(_model) do
    0
  end

  @impl Presto.Page
  def update(message, model) do
    case message do
      %{"event" => "click", "id" => "inc"} ->
        model + 1

      %{"event" => "click", "id" => "dec"} ->
        model - 1
    end
  end

  @impl Presto.Page
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
