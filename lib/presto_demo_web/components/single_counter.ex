defmodule PrestoDemoWeb.Components.SingleCounter do
  use Presto.Component
  use Phoenix.HTML
  require Logger

  @impl Presto.Component
  def initial_model(_model) do
    0
  end

  @impl Presto.Component
  def update(message, model) do
    case message do
      %{"type" => "click", "id" => "inc"} ->
        model + 1

      %{"type" => "click", "id" => "dec"} ->
        model - 1

      _ -> model
    end
  end

  @impl Presto.Component
  def render(model) do
    ~E"""
    <div>
      <span id="counter">Counter is: <%= inspect(model) %></span>
      <button id="inc" class="presto-click">More</button>
      <button id="dec" class="presto-click">Less</button>
    </div>
    """
  end
end
