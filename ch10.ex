defmodule LearnProcess do
  def g(x), do: :timer.sleep 10, IO.puts x

  def start do
    Enum.each(Range.new(1, 10), fn(i) ->
      spawn fn ->
        IO.puts i
      end
    end)
  end
end

#LearnProcess.start

defmodule Dolphins do
  def dolphin1 do
    receive do
      :do_a_flip -> IO.puts "How about no?"
      :fish -> IO.puts "So long and thanks for all the fish"
      _ -> IO.puts "Heh, we're smarter than you humans."
    after
      1_000 -> IO.puts "nothing after 1s"
    end
  end

  def dolphin2 do
    receive do
      {:do_a_flip, from} -> send(from, "How about no?")
      {:fish, from} -> send(from, "So long and thanks for all the fish")
      _ -> IO.puts "Heh, we're smarter than you humans."
    end
  end

  def dolphin3 do
    receive do
      {:do_a_flip, from} ->
        send(from, "How about no?")
        dolphin3
      {:fish, from} -> send(from, "So long and thanks for all the fish")
      _ ->
        IO.puts "Heh, we're smarter than you humans."
        dolphin3
    end
  end
end



