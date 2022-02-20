local create_table, drop_table, types
do
  local _obj_0 = require("lapis.db.schema")
  create_table, drop_table, types = _obj_0.create_table, _obj_0.drop_table, _obj_0.types
end
local insert
insert = require("lapis.db").insert
return {
  function(self)
    drop_table("items")
    create_table("items", {
      {
        "id",
        types.serial
      },
      {
        "name",
        types.text
      },
      "PRIMARY KEY (id)"
    })
    insert("items", {
      name = "coconut"
    })
    insert("items", {
      name = "pineapple"
    })
    insert("items", {
      name = "orange"
    })
    insert("items", {
      name = "apple"
    })
    return insert("items", {
      name = "watermelon"
    })
  end
}
