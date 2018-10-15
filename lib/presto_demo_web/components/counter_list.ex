defmodule PrestoDemoWeb.Components.CounterList do
  use Presto.Component
  use Phoenix.HTML
  require Logger

  @impl Presto.Component
  def initial_model(_model) do
    []
  end

  @impl Presto.Component
  def update(message, model) do
    case message do
      %{"type" => "click", "id" => "add"} ->
        model ++ [Presto.component(PrestoDemoWeb.Components.SingleCounter)]

      %{"type" => "click", "id" => "remove"} ->
        model |> Enum.drop(-1)

      _ -> model
    end
  end

  @impl Presto.Component
  def render(model) do
    ~E"""
    <div>
      <%= for {c, i} <- Enum.with_index(model) do %>
      <span id="c<%= i+1 %>"><%= Presto.render(c) %></span>
      <% end %>
      <button id="add" class="presto-click">Add</button>
      <button id="remove" class="presto-click">Remove</button>
    </div>
    """
  end
end
