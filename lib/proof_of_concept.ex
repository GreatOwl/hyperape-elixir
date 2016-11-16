defmodule Person do
  @behaviour HyperApe.Behaviours.ModelParser
  @derive [Poison.Encoder]
  defstruct name: 'me', age: 0, garbage: nil

  def parse() do
    %{"_name" => :name, "_age" => :age}
  end

  def render() do
    parse()
      |>HyperApe.Utilities.KeyParser.flipMap
  end
end

defmodule ProofOfConcept do
  @moduledoc "stuff"

  def stuff do
#    parseMap = %{"_name" => :name, "_age" => :age}
#    renderMap = HyperApe.Utilities.KeyParser.flipMap(parseMap)
    andrew = ~s({\"_name\": \"Andrew Nowak\", \"_age\": \"30\", \"_stuff\": \"my stuff\"})
      |>Poison.Parser.parse!
      |>HyperApe.Utilities.KeyParser.parse(Person.parse(), Person)
      |>Map.from_struct
#      |>HyperApe.Utilities.KeyParser.parse(Person.render())
#      |>Poison.encode([])
#      |>HyperApe.Utilities.KeyParser.jsonRender
  end

end