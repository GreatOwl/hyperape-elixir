defmodule HyperApe.Hal.Parser.Json.Resource do
  @moduledoc false

  def parse_resource_json(data) when is_bitstring(data) do
    Poison.Parser.parse!(data)
    |> parse_resource
  end

  def parse_resource(data, rel \\ "first") do
    keys = Hal.Resource.get_map
    |> HyperApe.Utilities.KeyParser.flip_map
    |> HyperApe.Utilities.KeyParser.keys

    transformed = data
    |> HyperApe.Utilities.KeyParser.list_to_struct(Hal.Resource.get_map, Hal.Resource)
    |> Map.put(:data, Map.drop(data, keys))
    |> Map.put(:rel, rel)

    extract_resources(transformed)
  end

  def extract_resources(%{__struct__: _} = map, list \\ []) do
    Map.from_struct(map)
    |> extract_resources(list)
#    map
#    ['stuff' | list]
  end

  def extract_resources([{ rel, value } | map], list = []) do
    case is_map(value) do
      true ->
        [ parse_resource(value, rel) | list ]
      false ->
#       TODO figure out how to recursivel extract embedded things
#        List.foldl(value, list, extract_resource_list(value, list, rel))

#        [ extract_resources(map, list) | list ]
    end
  end

#  def extract_resource_list([ value | map], list = [], rel) do
#    [ parse_resource(value, rel) | list]
#  end

  def parse_links(data) do

  end
  
end