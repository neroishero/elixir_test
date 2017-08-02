# elixir_test
for debug only
Elixir (1.5.1) recompiles the deps codes everytime after I edited my source code(e.g. server.ex).
Which I think it is an bug.
steps:
1. iex -S mix debug_client
2. edit server.ex source code
3. iex -S mix debug_client

My OS is win7 64.
Erlang OTP 20
Anyone pls reproduce the bug. Thanks.
