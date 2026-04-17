# Phase 4: Bring your own code

Optional. Only if you finish Phase 3 with time to spare.

You have an existing codebase. You want to know what mutant says
about it. Now is the moment.

## License

mutant is commercially licensed. For the duration of this workshop,
Markus Schirp grants you a free license to run mutant against
commercial code you have permission to work with.

This grant ends when the workshop ends. If you want to keep using
mutant on commercial code after, the standard pricing applies.

OSS projects are always free under the standard mutant license.

If you choose commercial code, that is fine. Make sure you do not
violate any NDAs when you show output to others or ask the workshop
host questions. Redact what needs redacting. Talk in generalities
when specifics would breach.

## Setup

Pick a Ruby project of your own. Public or private, OSS or
commercial.

In your project root, add to your Gemfile:

```ruby
gem 'mutant',       '~> 0.16'
gem 'mutant-rspec', '~> 0.16'
```

Then `bundle install`.

## Run mutant against one class

Do not run mutant against your whole codebase. It will take longer
than the workshop. Pick one class.

Pick a high-stakes one. Authentication. Authorization. Billing.
The god object nobody wants to refactor. The class your team is
least confident about.

That is where mutant tells you the most.

Configure `mutant.yml`:

```yaml
integration:
  name: rspec

matcher:
  subjects:
  - YourClass*
```

Run:

```
bundle exec mutant run --fail-fast
```

## Apply what you learned

Same rules from AGENTS.md still apply, even on your own code:

- Bucket A (code does too much) versus bucket B (test is missing).
- Do not skip mutants by configuring mutant to ignore them.
- Do not stub or mock the system under test.

Use your agent or do it by hand. Your choice.

## Ask when you hit surprises

A workshop cannot cover all of mutant's behavior. Real code is
weirder than exercise code. If mutant produces output you do not
understand, or your agent does something the rules did not predict,
ask the workshop host. That is what the time is for.

## What to take home

Whatever you discover stays with you. The license expires when the
workshop ends. The lessons do not.

If you find something interesting -- a class with surprisingly
many surviving mutants, a pattern that catches the agent gaming --
share it with the room before we close.
