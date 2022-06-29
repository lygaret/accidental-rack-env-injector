---
name:    env_injector
version: 0.0.1
summary: |
  a small rack middleware for injecting arbitrary k/v pairs into the request environment.
---

A Rack middleware for injecting arbitrary k/v pairs into the request environment.

## Usage

Add this repo to your `Gemfile`:

```ruby
gem "env_injector", "~> 0", git: "https://github.com/lygaret/accidental-rack-env-injector"
```

Then in `config.ru`:

```ruby
require 'accidental/rack/env_injector'

value = SomeExpensiveInitialization.perform
use Accidental::Rack::EnvInjector, "system.value" => value

run ->(env) do
  env['system.value'] == value
end
```
