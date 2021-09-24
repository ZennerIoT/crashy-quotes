defmodule CrashyWeb.PageController do
  use CrashyWeb, :controller

  @quotes [
    "I can't help thinking somewhere in the universe there has to be something better than man. Has to be.

    - Taylor, 'Planet Of The Apes'.",
    "They don't advertise for killers in the newspaper. That was my profession. Ex-cop. Ex-blade runner. Ex-killer.

    - Deckard, 'Blade Runner'.",
    "I am the scales of justice! Conductor of the choir of death!

    - The Bullet Farmer, 'Mad Max: Fury Road'.",
    "There isn't enough life on this ice cube to fill a space cruiser.

    - Han Solo, 'Star Wars: The Empire Strikes Back'.",
    "I'll be back.

    - Terminator, 'The Terminator'.",
    "You could not live with your own failure. Where did that bring you? Back to me.

    - Thanos, 'Avengers: Endgame'.",
    "Attack ships on fire off the shoulder of Orion. I watched C-beams glitter in the dark near the Tannhäuser Gate. All those moments will be lost in time, like tears in rain. Time to die.

    - Roy Batty, 'Blade Runner'.",
    "No. Strike me down in anger and I'll always be with you. Just like your father.

    - Luke Skywalker, 'Star Wars: The Last Jedi'.",
    "The Avengers. That's what we call ourselves; we're sort of like a team. 'Earth's Mightiest Heroes' type thing.

    - Tony Stark, 'The Avengers'.",
    "Steven Jacobs: You used an untested drug on your father. I could end your career with one phone call.

    Will Rodman: Let me save you the trouble. I quit.

    - 'Rise Of The Planet Of The Apes'.",
    "Don't forget, I'm half-human. So that fifty percent of me that's stupid, that's a hundred percent you.

    - Peter Quill, 'Avengers: Infinity War'"
  ]

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def api(conn, _params) do
    conn
    |> put_resp_header("content-type", "text/plain")
    |> send_resp(200, random_quote())
  end

  def random_quote() do
    remaining = :persistent_term.get(:remaining_requests)

    case remaining do
      0 -> raise(RuntimeError, message: "quote mine exhausted")
      rem -> :persistent_term.put(:remaining_requests, rem - 1)
    end

    Enum.random(@quotes)
    |> String.replace(~r/\n[ \t]+/, "\n")
  end
end
