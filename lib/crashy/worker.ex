defmodule Crashy.Worker do
  use GenServer

  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts)
  end

  def init(_) do
    :timer.send_after(:timer.minutes(2), :crash)
    {:ok, nil}
  end

  def handle_info(:foo, state) do
    {:noreply, state}
  end
end
