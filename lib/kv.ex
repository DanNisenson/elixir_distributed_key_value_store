defmodule KV do
  use Application

  # The @impl true annotation says we are implementing a callback
  @impl true
  def start(_mode, _opts) do
    children = [
      {Registry, name: KV, keys: :unique},
      {DynamicSupervisor, name: KV.BucketSupervisor, strategy: :one_for_one},
      {Task.Supervisor, name: KV.ServerSupervisor},
      Supervisor.child_spec({Task, fn -> KV.Server.accept(4040) end}, restart: :permanent)
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end

  @doc """
  Get PID or {name, node} for registered process by name
  """
  def lookup_bucket(name) do
    GenServer.whereis(via(name))
  end

  @doc """
  Create a supervised bucket process
  """
  def create_bucket(name) do
    DynamicSupervisor.start_child(KV.BucketSupervisor, {KV.Bucket, name: via(name)})
  end

  # Get tuple for Registry lookup
  defp via(name) do
    {:via, Registry, {KV, name}}
  end
end
