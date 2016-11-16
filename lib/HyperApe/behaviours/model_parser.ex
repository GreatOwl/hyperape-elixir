defmodule HyperApe.Behaviours.ModelParser do
  @moduledoc false

  @callback parse() :: map
  @callback render() :: map
  
end