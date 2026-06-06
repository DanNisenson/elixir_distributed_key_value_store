defmodule KVTest do
  use ExUnit.Case
  doctest KV

  test "create and look up a bucket" do
    name = "a unique name"
    assert KV.lookup_bucket(name) == nil
    assert {:ok, bucket} = KV.create_bucket(name)
    assert KV.lookup_bucket(name) == bucket
    assert KV.create_bucket(name) == {:error, {:already_started, bucket}}
  end
end
