defmodule WebsockexDemo.Repo do
  use Ecto.Repo,
    otp_app: :websockex_demo,
    adapter: Ecto.Adapters.Postgres
end
