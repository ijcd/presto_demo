defmodule PrestoDemo.FeatureCase do
  use ExUnit.CaseTemplate

  using do
    quote location: :keep do
      use Wallaby.DSL

      alias PrestoDemo.Repo
      import Ecto
      import Ecto.Changeset
      import Ecto.Query

      import PrestoDemoWeb.Router.Helpers

      def write_html(session, filename) do
        session
        |> html()
        |> File.write(filename)
        session
      end

      def inspect_html(session) do
        session
        |> html()
        |> IO.inspect
        session
      end

      def inspect_html_pretty(session) do
        Process.flag(:trap_exit, true)
        {:ok, tidy_pid, tidy_os_pid} = Exexec.run_link("tidy -i -w 120", stdin: true, stdout: true)
        :ok = Exexec.send(tidy_pid, html(session))
        :ok = Exexec.send(tidy_pid, :eof)
        receive do
          # {:EXIT, ^tidy_os_pid, {:exit_status, rc}}  -> raise "Tidy exited with rc=#{rc}"
          {:stdout, ^tidy_os_pid, msg}  -> IO.puts(msg)
        after
          1_000 -> raise "Nothing from tidy nothing after 1s"
        end
        session
      end

      def html(session) do
        Wallaby.Element.attr(
          find(session, Wallaby.Query.css("html")),
          "outerHTML"
        )
      end

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
