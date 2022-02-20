local lapis = require("lapis")
local Model
Model = require("lapis.db.model").Model
local OrderedPaginator
OrderedPaginator = require("lapis.db.pagination").OrderedPaginator
local respond_to
respond_to = require("lapis.application").respond_to
local json_params
json_params = require("lapis.application").json_params
local Items
do
  local _class_0
  local _parent_0 = Model
  local _base_0 = { }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, ...)
      return _class_0.__parent.__init(self, ...)
    end,
    __base = _base_0,
    __name = "Items",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        local parent = rawget(cls, "__parent")
        if parent then
          return parent[name]
        end
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  Items = _class_0
end
do
  local _class_0
  local _parent_0 = lapis.Application
  local _base_0 = {
    ["/"] = function(self)
      return self:html(function()
        link({
          rel = "stylesheet",
          href = "/static/styles.css"
        })
        h1("REST API based on lapis")
        p("This is a simple rest api based on lapis.\n        It is written in moonscript and compiled to lua.\n        The table that has been created during migration contains only\n        two collumns: id and name.\n        If you would like to try it out, you may use curl from command line:")
        code(" curl -H \"Content-Type: application/json\" -X HTTP_METHOD -d '{\"name\": \"product_name\"}' http://localhost:8080/products ")
        p("Options:")
        code("-H \"Content-Type: application/json\" and -d '{\"name\": \"product_name\"}'")
        p("Are only needed when you are creating a product or updating an existing one. The \"Content-Type\" needs to be specified for lapis to parse the request correctly. Below are the use cases:")
        element("table", function()
          tr(function()
            th("Scenario")
            th("HTTP method")
            return th("URL format")
          end)
          tr(function()
            td("Add a product")
            td("POST")
            return td("/products")
          end)
          tr(function()
            td("Retrieve all products")
            td("GET")
            return td("/products")
          end)
          tr(function()
            td("Retrive product by id")
            td("GET")
            return td("/products/product_id")
          end)
          tr(function()
            td("Delete a product")
            td("DELETE")
            return td("/products/product_id")
          end)
          return tr(function()
            td("Edit product information")
            td("PUT")
            return td("/products/product_id")
          end)
        end)
        p("There is also an option to use the endpoints inside the browser, without specifying the request (default is GET). You will need to specify query parameters in the url instead:")
        return element("table", function()
          tr(function()
            th("Scenario")
            return th("URL format")
          end)
          tr(function()
            td("Add a product")
            return td("/product_create?name=product_name")
          end)
          tr(function()
            td("Retrieve all products")
            return td("/product_get_all")
          end)
          tr(function()
            td("Retrive product by id")
            return td("/product_get?id=product_id")
          end)
          tr(function()
            td("Delete a product")
            return td("/product_delete?id=product_id")
          end)
          return tr(function()
            td("Edit product information")
            return td("/product_update?id=product_id&name=new_product_name")
          end)
        end)
      end)
    end,
    ["/products"] = respond_to({
      GET = function(self)
        local item = Items:select()
        return {
          json = item
        }
      end,
      POST = json_params(function(self)
        local item = Items:create({
          name = self.params.name
        })
        return {
          json = item
        }
      end)
    }),
    ["/products/:index"] = respond_to({
      GET = function(self)
        local item = Items:find({
          id = self.params.index
        })
        return {
          json = item
        }
      end,
      PUT = json_params(function(self)
        local item = Items:find({
          id = self.params.index
        })
        item.name = self.params.name
        item:update("name")
        return {
          json = item
        }
      end),
      DELETE = function(self)
        local item = Items:find({
          id = self.params.index
        })
        item:delete()
        return "Deleted item " .. tostring(item.name)
      end
    }),
    ["/product_create"] = function(self)
      local item = Items:create({
        name = self.params.name
      })
      return {
        json = item
      }
    end,
    ["/product_get"] = function(self)
      local item = Items:find({
        id = self.params.id
      })
      return {
        json = item
      }
    end,
    ["/product_update"] = function(self)
      local item = Items:find({
        id = self.params.id
      })
      item.name = self.params.name
      item:update("name")
      return {
        json = item
      }
    end,
    ["/product_delete"] = function(self)
      local item = Items:find({
        id = self.params.id
      })
      item:delete()
      return "Deleted item " .. tostring(item.name)
    end,
    ["/product_get_all"] = function(self)
      local items = Items:select()
      return {
        json = items
      }
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, ...)
      return _class_0.__parent.__init(self, ...)
    end,
    __base = _base_0,
    __name = nil,
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        local parent = rawget(cls, "__parent")
        if parent then
          return parent[name]
        end
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  return _class_0
end
