defmodule HyperApe.Utilities.KeyParser do
  @moduledoc false

  def flip_map(map) do
    Enum.map(map, fn {k, v} -> {v, k} end)
  end

  def keys(map = [], list = []) do
    list
  end

  def keys([{key, value} | map], list \\ []) do
    [key | keys(map, list)]
  end

  def map_keys(subject_map, key_mapping = [], new_map \\ %{}) do
    new_map
  end

  def map_keys(orig_map, [{old, new} | key_mapping], new_map) do
    case Map.has_key?(orig_map, old) do
      true ->
        new_map
        |> Map.put(new, orig_map[old])
        |> fn(new_map) -> map_keys(orig_map, key_mapping, new_map) end.()
      false ->
        map_keys(orig_map, key_mapping, new_map)
    end
  end

  def list_to_map(subject, key_map) do
    map_keys(subject, flip_map(key_map))
  end

  def list_to_struct(subject, key_map, struct) do
    list_to_map(subject, key_map)
    |> cast_struct(struct)
  end

  def cast_struct(map, struct) do
    struct(struct, map)
  end

  def render(%{__struct__: _} = arg, map) do
    Map.from_struct(arg)
    |> render(map)
  end

  def render(arg, map) when is_map(arg) do
    map_keys(arg, map)
  end
end