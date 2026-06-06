defmodule KV.Bucket do
  use Agent

  @doc """
  start a new bucket with options
  """
  def start_link(opts \\ []) do
    Agent.start_link(fn -> %{} end, opts)
  end

  @doc """
  get value by key
  """
  def get(bucket, key) do
    Agent.get(bucket, & &1[key])
  end

  @doc """
  set key-value pair
  """
  def put(bucket, key, value) do
    Agent.update(bucket, &Map.put(&1, key, value))
  end

  @doc """
  delete key value pair
  returns deleted value
  """
  def delete(bucket, key) do
    Agent.get_and_update(bucket, &Map.pop(&1, key))
  end
end
