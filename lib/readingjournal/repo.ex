defmodule Readingjournal.Repo do
  use Ecto.Repo,
    otp_app: :readingjournal,
    adapter: Ecto.Adapters.Postgres
end
