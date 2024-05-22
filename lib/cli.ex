defmodule InteractiveNotes.CLI do
  def main do
    IO.puts("Welcome to the number 1 notes app in the world!!!")
    action([])
  end

  defp action(notes) do
    IO.puts("""
    Please choose an action:
    1. New Note
    2. List Notes
    3. Delete Note
    4. Exit
    5. does nothing
    """)

    choice = IO.gets("Your Choice: -> ") |> String.trim()
    case choice do
      "1" -> add_note(notes)
      "2" -> list_notes(notes)
      "3" -> delete_note(notes)
      "4" -> exit()
      _ ->
        IO.puts("unknown command")
        action(notes)
    end
  end

  defp add_note(notes) do
    content = IO.gets("Enter the content of the note:") |> String.trim()
    updated_notes = InteractiveNotes.Notes.add(notes, content)
    action(updated_notes)
  end

  defp list_notes(notes) do
    Enum.each(notes, fn note -> IO.puts("#{note.id} --> #{note.content}\n") end)
    action(notes)
  end

  defp delete_note(notes) do
    delete_id = IO.gets("Enter the id of the note that you want to delete") |> String.trim() |> String.to_integer()
    updated_notes = InteractiveNotes.Notes.delete(notes, delete_id)
    action(updated_notes)
  end

  defp exit do
    IO.puts("Goodbye!!!")
  end
end
