defmodule PrestoDemoWeb.Presto.Root do
  use Presto.Page
  use Taggart.HTML
  require Logger

  defmodule Model do
    defstruct slide: 1,
              last_message: nil

    @type t :: %__MODULE__{
            slide: integer(),
            last_message: term()
          }
  end

  def code_change(old_vsn, state, extra) do
    IO.puts("New version. Moving out of #{old_vsn} #{inspect(extra)}")
    {:ok, state}
  end

  @impl Presto.Page
  def initial_model(_model) do
    %Model{}
  end

  @impl Presto.Page
  def update(message, model) do
    IO.inspect(message, label: "MESSAGE")
    model = %{model | last_message: message}

    case message do
      # left arrow
      %{"event" => "keydown", "key_code" => 37} ->
        %{model | slide: max(1, model.slide - 1)}

      # right arrow
      %{"event" => "keydown", "key_code" => 39} ->
        %{model | slide: min(2, model.slide + 1)}

      _ ->
        Logger.warn("Unknown message: #{inspect(message)}")
        model
    end
    |> IO.inspect(label: "NEW MODEL")
  end

  @impl Presto.Page
  def render(model) do
    div do
      render_slide(model.slide)
      hr
      inspect(model.last_message)
    end
  end

  def render_slide(1) do
    "xthis is slide 1"
  end

  def render_slide(2) do
    "this is slide 2"
  end
end
