defmodule PrestoDemoWeb.Presto.Root do
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
      :current -> model
      :inc -> model + 1
    end
  end

  @impl Presto.Page
  def render(model) do
    {:safe, "Counter is: #{inspect(model)}"}
  end
end
