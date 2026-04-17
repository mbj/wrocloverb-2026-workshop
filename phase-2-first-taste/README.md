# Phase 2: First taste

100% line coverage is not 100% semantic coverage.

This phase is a warm-up. No agent. BEFORE we do anything we discuss
the test coverage with the room.

## 1. Install and verify coverage

Expected Ruby version: 4.x.

```
bundle install
SIMPLECOV=1 bundle exec rspec
```

Expected output: all examples pass, line coverage is 100%.

## 2. Discuss with the room

Before running mutant, look at `lib/age.rb` and `spec/age_spec.rb`.

- Would you ship this code with these tests?
- Is 100% line coverage enough for you?
- What, if anything, do you think is missing?

No code changes yet. Just discussion.

## 3. Run mutant

```
bundle exec mutant run
```

Read the output carefully. Each surviving mutant is a change to the
production code that the test suite did not notice. For each one:

- Which method was mutated?
- What did mutant change?
- Why do the existing tests still pass against the changed code?

Pick one surviving mutant and talk through it with the room.

## 4. Work time

Your task: get the mutation score to 100%.

You may change anything -- `lib/age.rb`, the spec file, or both.
Some of the starting tests are bad. They hit lines without verifying
behavior. You may rewrite them.

Rules:

- Line coverage stays at 100%.
- The goal is 100% mutation coverage.

Iterate with `--fail-fast` so you only deal with one surviving mutant
at a time:

```
bundle exec mutant run --fail-fast
```

1. Mutant stops at the first surviving mutant. Read the diff.
2. Change code, tests, or both until it dies.
3. Re-run `bundle exec mutant run --fail-fast`.
4. Repeat until no surviving mutants remain.

Once `--fail-fast` gives you a green run, do one final full run:

```
bundle exec mutant run
```

to confirm 100% mutation coverage.

If you finish early, help a neighbor and raise surprises to the
workshop organizer.
