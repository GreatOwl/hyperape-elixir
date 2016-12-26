defmodule Hal do
  @callback get_map() :: List.t
end

defmodule Hal.Resource do
  @behaviour Hal
  defstruct links: nil, embedded: nil, data: nil, rel: nil
  @mapping [links: "_links", embedded: "_embedded"]

  def get_map() do
    @mapping
  end
end

defmodule Hal.Link do
  @behaviour Hal
  defstruct rel: 'self', title: 'this resource', name: 'self', href: '', type: ''
  @mapping [name: "name", title: "title", href: "href", type: "type"]

  def get_map() do
    @mapping
  end

end