defmodule HelloPhoenix.HelloFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `HelloPhoenix.Hello` context.
  """

  @doc """
  Generate a message.
  """
  def message_fixture(attrs \\ %{}) do
    {:ok, message} =
      attrs
      |> Enum.into(%{
        content: "some content"
      })
      |> HelloPhoenix.Hello.create_message()

    message
  end
end
