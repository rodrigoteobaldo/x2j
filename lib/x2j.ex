defmodule X2J do
  alias ExJSON, as: JSON

  def transform(path) do
    path
    |> File.read!
    |> :erlsom.simple_form
    |> process_structure
    # |> generate_json
    # |> create_output_file
  end

  @doc """
  Processa estrutura vinda do erlsom

  ex.: [ ]
  """
  def process_structure([]), do: []
  def process_structure({:ok, result, _}), do: process_structure(result)
  def process_structure(structure, result \\ {}) do
    structure
  end

  def generate_json(processed) do
    JSON.generate(processed)
  end

  def create_output_file(content) do
    # content = Enum.to_list(content)
    File.write("result.json", content)
  end

end
