lapis = require "lapis"

import Model from require "lapis.db.model"
import OrderedPaginator from require "lapis.db.pagination"
import respond_to from require "lapis.application"
import json_params from require "lapis.application"

class Items extends Model

class extends lapis.Application

  "/": =>
    @html ->
        link rel: "stylesheet", href: "/static/styles.css"
        h1 "REST API based on lapis"
        p "This is a simple rest api based on lapis.
        It is written in moonscript and compiled to lua.
        The table that has been created during migration contains only
        two collumns: id and name.
        If you would like to try it out, you may use curl from command line:"
        code " curl -H \"Content-Type: application/json\" -X HTTP_METHOD -d '{\"name\": \"product_name\"}' http://localhost:8080/products "
        p "Options:"
        code "-H \"Content-Type: application/json\" and -d '{\"name\": \"product_name\"}'"
        p "Are only needed when you are creating a product or updating an existing one. The \"Content-Type\" needs to be specified for lapis to parse the request correctly. Below are the use cases:"
        element "table", ->
            tr ->
                th "Scenario"
                th "HTTP method"
                th "URL format"
            tr ->
                td "Add a product"
                td "POST"
                td "/products"
            tr ->
                td "Retrieve all products"
                td "GET"
                td "/products"
            tr ->
                td "Retrive product by id"
                td "GET"
                td "/products/product_id"
            tr ->
                td "Delete a product"
                td "DELETE"
                td "/products/product_id"
            tr ->
                td "Edit product information"
                td "PUT"
                td "/products/product_id"
        p "There is also an option to use the endpoints inside the browser, without specifying the request (default is GET). You will need to specify query parameters in the url instead:"
        element "table", ->
            tr ->
                th "Scenario"
                th "URL format"
            tr ->
                td "Add a product"
                td "/product_create?name=product_name"
            tr ->
                td "Retrieve all products"
                td "/product_get_all"
            tr ->
                td "Retrive product by id"
                td "/product_get?id=product_id"
            tr ->
                td "Delete a product"
                td "/product_delete?id=product_id"
            tr ->
                td "Edit product information"
                td "/product_update?id=product_id&name=new_product_name"
        
  "/products": respond_to {
        GET: =>
            item = Items\select!
            json: item
        POST: json_params =>
            item = Items\create name: @params.name
            json: item
  }
  
  "/products/:index": respond_to {
        GET: =>
            item = Items\find id: @params.index
            json: item  
        PUT: json_params =>
            item = Items\find id: @params.index
            item.name = @params.name
            item\update "name"
            json: item
        DELETE: =>
            item = Items\find id: @params.index
            item\delete!
            "Deleted item #{item.name}"
    }
    
  "/product_create": =>
    item = Items\create name: @params.name
    json: item
    
  "/product_get": =>
    item = Items\find id: @params.id
    json: item
    
  "/product_update": =>
    item = Items\find id: @params.id
    item.name = @params.name
    item\update "name"
    json: item
    
  "/product_delete": =>
    item = Items\find id: @params.id
    item\delete!
    "Deleted item #{item.name}"
    
  "/product_get_all": =>
    items = Items\select!
    json: items
