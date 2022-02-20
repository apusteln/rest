local config
config = require("lapis.config").config
config("production", function()
  num_workers(8)
  return code_cache("on")
end)
return config("development", function()
  postgres(function()
    host("127.0.0.1")
    user("postgres")
    password("postgres")
    return database("postgres")
  end)
  num_workers(1)
  code_cache("off")
  return postgresql_url("postgres://postgres:postgres@127.0.0.1/postgres")
end)
