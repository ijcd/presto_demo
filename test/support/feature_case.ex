defmodule PrestoDemo.FeatureCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Wallaby.DSL

      alias PrestoDemo.Repo
      import Ecto
      import Ecto.Changeset
      import Ecto.Query

      import PrestoDemoWeb.Router.Helpers
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(PrestoDemo.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(PrestoDemo.Repo, {:shared, self()})
    end

    metadata = Phoenix.Ecto.SQL.Sandbox.metadata_for(PrestoDemo.Repo, self())
    {:ok, session} = Wallaby.start_session(metadata: metadata)
    {:ok, session: session}
  end
end
