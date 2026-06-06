defmodule KV.BucketTest do
  use ExUnit.Case, async: true

  @doc """
  Here we the Agent's PID to reference the process
  """
  test "stores values by key 1" do
    {:ok, bucket} = KV.Bucket.start_link()
    assert KV.Bucket.get(bucket, "milk") == nil
  end

  @doc """
  We can name the Agent's process,
  but we might run into name collisions with other tests running in parallel
  """
  test "stores values by key 2" do
    KV.Bucket.start_link(name: :test_bucket)
    assert KV.Bucket.get(:test_bucket, "milk") == nil
  end

  @doc """
  To avoid name collisions, we can use the test's metadata
  """
  test "stores values by key 3", config do
    KV.Bucket.start_link(name: config.test)
    assert KV.Bucket.get(config.test, "milk") == nil

    KV.Bucket.put(config.test, "milk", 3)
    assert KV.Bucket.get(config.test, "milk") == 3
    assert KV.Bucket.delete(config.test, "milk") == 3
    assert KV.Bucket.get(config.test, "milk") == nil
  end
end
