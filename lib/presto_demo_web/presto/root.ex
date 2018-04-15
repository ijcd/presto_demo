defmodule PrestoDemoWeb.Presto.Root do
  use Presto.Page
  use Taggart.HTML
  require Logger

  defmodule Model do
    defstruct slide: 0,
              last_message: nil

    @type t :: %__MODULE__{
            slide: integer(),
            last_message: term()
          }
  end

  @impl Presto.Page
  def initial_model(model \\ 0) do
    %Model{}
  end

  @impl Presto.Page
  def update(message, model) do
    IO.inspect(message, label: "MESSAGE")
    model = %{model | last_message: message}

    case message do
      # left arrow
      %{"event" => "keydown", "key_code" => 37} ->
        %{model | slide: model.slide - 1}

      # right arrow
      %{"event" => "keydown", "key_code" => 39} ->
        %{model | slide: model.slide + 1}

      _ ->
        Logger.warn("Unknown message: #{inspect(message)}")
        model
    end
    |> IO.inspect(label: "NEW MODEL")
  end

  @impl Presto.Page
  def render(model) do
    div(class: "presto-component", id: "22") do
      div(id: "33") do
        div(class: "presto-component", id: "44") do
          inspect(model.slide)
          br

          button(id: "inc", class: "presto-click") do
            "More"
          end

          br
          inspect(model.last_message)
        end
      end
    end
  end
end
