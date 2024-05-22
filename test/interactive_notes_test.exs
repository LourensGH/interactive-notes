defmodule InteractiveNotesTest do
  use ExUnit.Case
  doctest InteractiveNotes

  test "greets the world" do
    assert InteractiveNotes.hello() == :world
  end
end
