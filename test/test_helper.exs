ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Spellit.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Spellit.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Spellit.Repo)

