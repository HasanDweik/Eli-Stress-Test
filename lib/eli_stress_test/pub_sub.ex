defmodule EliStressTest.PubSub do
  @moduledoc """
  PubSub module for broadcasting test events.
  """
  def broadcast(topic, message) do
    Phoenix.PubSub.broadcast(EliStressTest.PubSub, topic, message)
  end

  def subscribe(topic) do
    Phoenix.PubSub.subscribe(EliStressTest.PubSub, topic)
  end
end
