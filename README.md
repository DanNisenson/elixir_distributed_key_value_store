# KV

The application works as a distributed key-value store. We are going to organize key-value pairs into buckets and distribute those buckets across multiple nodes. We will also build a simple client that allows us to connect to any of those nodes and send requests such as:

```
CREATE shopping
OK

PUT shopping milk 1
OK

PUT shopping eggs 3
OK

GET shopping milk
1
OK

DELETE shopping eggs
OK
```

The requirements are (see elixir -v):

Elixir 1.18.0 onwards
Erlang/OTP 27 onwards

In order to build our key-value application, we are going to use three main tools:

OTP (Open Telecom Platform) is a set of libraries that ships with Erlang. Erlang developers use OTP to build robust, fault-tolerant applications. In this chapter we will explore how many aspects from OTP integrate with Elixir, including supervision trees, event managers and more;

Mix is a build tool that ships with Elixir that provides tasks for creating, compiling, testing your application, managing its dependencies and much more;

ExUnit is a unit-test based framework that ships with Elixir.

## Dev

Run `iex -S mix`

## Test

Run `mix test`
