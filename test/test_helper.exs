ExUnit.start()

Ecto.Adapters.SQL.Sandbox.mode(PrestoDemo.Repo, :manual)

# Wallaby
{:ok, _} = Application.ensure_all_started(:wallaby)
Application.put_env(:wallaby, :base_url, PrestoDemoWeb.Endpoint.url)

# Exexec
Exexec.start()
