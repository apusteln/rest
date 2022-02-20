import create_table, drop_table, types from require "lapis.db.schema"
import insert from require "lapis.db"
{
    =>
        drop_table "items"
        
        create_table "items", {
            {"id", types.serial}
            {"name", types.text}
            
            "PRIMARY KEY (id)"
        }
        
        insert "items", {name: "coconut"}
        insert "items", {name: "pineapple"}
        insert "items", {name: "orange"}
        insert "items", {name: "apple"}
        insert "items", {name: "watermelon"}

}
