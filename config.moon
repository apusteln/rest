import config from require "lapis.config"

config "production", ->
    num_workers 8
    code_cache "on"
    
config "development", ->
    postgres ->
        host "127.0.0.1"
        user "postgres"
        password "postgres"
        database "postgres"
    num_workers 1
    code_cache "off"
    postgresql_url "postgres://postgres:postgres@127.0.0.1/postgres"
