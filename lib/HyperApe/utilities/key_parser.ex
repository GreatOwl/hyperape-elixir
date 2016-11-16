defmodule HyperApe.Utilities.KeyParser do
  @moduledoc false

  alias HyperApe.Behaviours.ModelParser

  def removeNil([key | rest], increment, map) do
    
  end

  def removeNil([], increment, map) do
    map
  end

  def jsonParse(string, keyMap) do
    Poison.Parser.parse!(string)
      |>parse(keyMap)
  end

  def jsonParse(string, keyMap, struct) do
    Poison.Parser.parse!(string)
      |>parse(keyMap, struct)
  end

  def flipStruct(struct) do
    Map.from_struct(struct)
    |>flipMap
  end

  def flipMap(map) do
#    Map.to_list(map)
    map
      |>Enum.map(fn {k, v} -> {v, k} end)
      |>Enum.into(%{})
  end

  def parse(map, keyMap, struct) do
#    keyMap = ModelParser.parse()
    parse(map, keyMap)
      |>castStruct(struct)
  end

  def parse(map, keyMap) do
    Enum.to_list(map)
    |> replaceKeys([], map, keyMap)
  end

  defp castStruct(map, struct) do
    struct(struct, map)
  end

  defp replaceKeys([], increment, map, keyMap) do
    map
  end

  defp replaceKeys([key | rest], increment, map, keyMap) do
    keyName = getKeyName(key)
    case Map.fetch(keyMap, keyName) do
      {:ok, newKey} ->
        map = replaceKey(map, newKey, keyName)
      :error ->
    end
    replaceKeys(rest, increment, map, keyMap)
  end

  defp replaceKey(map, newKey, oldKey) do
    case Map.fetch(map, oldKey) do
      {:ok, value} ->
        map = Map.put(map, newKey, value)
        |> Map.delete(oldKey)
      :error ->
    end
    map
  end

  defp getKeyName(key) do
    Tuple.to_list(key)
    |> List.first
  end
  
end