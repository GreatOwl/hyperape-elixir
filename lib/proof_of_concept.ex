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
    andrew = ~s({\"_name\": \"Andrew Nowak\", \"_age\": \"30\", \"_stuff\": \"my stuff\"})
      |> Poison.Parser.parse!
      |> HyperApe.Utilities.KeyParser.parse_list_to_struct(Person.getMap, Person)
      |> HyperApe.Utilities.KeyParser.render(Person.getMap)
      |> Poison.encode([])
      |> elem(1)
  end
end