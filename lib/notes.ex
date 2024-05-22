defmodule InteractiveNotes.Notes do
  defstruct id: nil, content: ""

  @doc """
  Starts the app with empty notes list
  """
  def start do
    []
  end

  @doc """
  Adds not to list
  """
  def add(notes, content) do
    id = Enum.count(notes) + 1
    new_note = %InteractiveNotes.Notes{id: id, content: content}
    notes = [new_note | notes]
    notes
  end

  @doc """
  List all notes
  """
  # def list(notes) do
  #   notes
  # end

  def delete(notes, id) do
    Enum.filter(notes, fn note -> note.id != id end)
  end
end
