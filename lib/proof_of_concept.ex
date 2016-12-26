defmodule Person do
  @derive [Poison.Encoder]

  defstruct name: 'me', age: 0, garbage: nil
  @mapping [name: "_name", age: "_age"]

  def getMap() do
    @mapping
  end
end

defmodule ProofOfConcept do
  @moduledoc "stuff"

  def stuff do
#    andrew = ~s({\"_name\": \"Andrew Nowak\", \"_age\": \"30\", \"_stuff\": \"my stuff\"})
    data = Path.relative('sample.json')
     |> File.read!

    HyperApe.Hal.Parser.Json.Resource.parse_resource_json(data)
#    resource = Poison.Parser.parse!(data)
#    |> HyperApe.Utilities.KeyParser.list_to_struct(Hal.Resource.get_map(), Hal.Resource)

#    |> HyperApe.Utilities.KeyParser.render(Person.getMap)
#    |> Poison.encode([])
#    |> elem(1)
  end
end