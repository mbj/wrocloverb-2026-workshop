# Phase 3: Agent loop

Same starting state as Phase 2. Same goal: 100% mutation coverage.
This time the agent does the work. You direct it and review.

## 1. Setup

Expected Ruby version: 4.x.

```
bundle install
SIMPLECOV=1 bundle exec rspec
```

Expected output: all examples pass, line coverage is 100%.

## 2. Read AGENTS.md

The standing rules for the agent live in `AGENTS.md` at the root of
this directory. Claude Code, Cursor, and Codex auto-load it. Read it
yourself first so you know what the agent has been told.

## 3. Prompt the agent

Open the agent in this directory and prompt:

```
Get mutation coverage to 100%.
```

That is the entire prompt. AGENTS.md carries the rest.

## 4. Review every change

Do not auto-accept. For each diff the agent proposes:

- Did it fall into bucket A (simplify the implementation) or bucket
  B (add a missing test)? Did the explanation match what it actually
  did?
- Did it touch `mutant.yml`? It should not.
- Did it use `send` or `__send__` in tests? It should not.
- Did it stub or mock `Age`? It should not.

Push back when the agent strays. The agent will negotiate. Hold the
line.

## 5. Verify

When the agent claims done, verify yourself:

```
SIMPLECOV=1 bundle exec rspec
bundle exec mutant run
```

Both must be green.

## 6. What about new code?

Tests green. Mutant green. Now grow the code.

Ask the agent to add a `can_vote_in?(country)` method to `Age` that
returns true or false based on the country's voting age:

- US: 18
- Japan: 18
- South Korea: 19
- Indonesia: 17

Prompt:

```
Add the can_vote_in?(country) feature.
```

Same rules apply. AGENTS.md has not changed. Verify the same way:

```
SIMPLECOV=1 bundle exec rspec
bundle exec mutant run
```

Both must be green when the agent claims done.

## 7. Reflect

- How many turns did it take?
- Where did the agent try to cheat?
- Which surviving mutants did it correctly identify as bucket A
  (code does too much) versus bucket B (test is missing)?
- What did you have to push back on?

If you finish early, help a neighbor and raise surprises to the
workshop organizer.
