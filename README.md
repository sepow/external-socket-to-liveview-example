Here are two elixir apps.

Spew creates a messages and sends it via websocket to any connected clients
MyApp connects to Spew at startup and receives the messages.

To see it in action, run:

```zsh
$ cd spew
$ mix deps.get
$ mix run --no-halt
```

Then in another terminal:

```zsh
$ cd my_app
$ mix deps.get
$ mix phx.server
```

Now, open http://localhost:4000 and you'll see the messages from Spew delivered directly into your browser via the magic of liveview.
