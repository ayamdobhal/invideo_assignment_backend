# invideo_assignment_backend

The backend for the assignment. Written in Elixir using the Plug library.
Has a single `/generate_shader` (POST) method that takes a `description` in the body and returns a GLSL shader code.

## Requirements

- Elixir
- Gemini API Key

## Set up

1. Clone the Repository

```bash
git clone https://github.com/ayamdobhal/invideo_assignment_backend
cd invideo_assignment_backend
```

2. Install Dependencies

```bash
mix deps.get
```

3. Export your Gemini API Key

```bash
export GEMINI_API_KEY=<your-gemini-api-key>
```

4. Running the Server

```bash
mix run --no-halt
```

The server can be accessed at [http://localhost:4000](https://localhost:4000)

## Testing

To run the tests:

Make sure Gemini API Key is exported to the environment first.

```bash
export GEMINI_API_KEY=<your-gemini-api-key>
```

Then run:

```bash
mix test
```
