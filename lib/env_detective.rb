require "env_detective/version"
require "env_detective/extension"

ENV = EnvDetective::Extension.new(ENV)
