# REST API based on lapis
This is a simple rest api based on lapis. It is written in moonscript and compiled to lua. It was tested using a table on a locally hosted postgres 12.9 for Ubuntu. Lapis has been used with nginx from openresty installation.

The current configuration expects the postgres database to be named "postgres" and to have a valid user/password of postgres/postgres.
After setting up the server to enable lapis yoou need to issue the following commands:
```
lapis migrate development
lapis server development
```

The table created during migration contains only two collumns: id and name.

The API facilitates the following commands:
| **Scenario**             | **HTTP method** | **URL format**       |
|--------------------------|-----------------|----------------------|
| Add a product            | POST            | /products            |
| Retrieve all products    | GET             | /products            |
| Retrive product by id    | GET             | /products/product_id |
| Delete a product         | DELETE          | /products/product_id |
| Edit product information | PUT             | /products/product_id |

There is also an option to use the endpoints inside the browser, without specyfing the request (default is GET). You will need to specify query parameters in the url instead:
| **Scenario**             | **URL format**                                      |
|--------------------------|-----------------------------------------------------|
| Add a product            | /product_create?name=product_name                   |
| Retrieve all products    | /product_get_all                                    |
| Retrive product by id    | /product_get?id=product_id                          |
| Delete a product         | /product_delete?id=product_id                       |
| Edit product information | /product_update?id=product_id&name=new_product_name |

The API has been tested using curl commands with different HTTP methods, like this:
```
curl -H "Content-Type: application/json" -X «HTTP_METHOD» -d '{"«name»": "«product_name»"}' http://localhost:8080/products
```

---
Here are some tested querries, we start with database looking like this:

![Starting database](https://github.com/apusteln/rest/blob/main/imags/db_00.png)

Then we post one product

![POST](https://github.com/apusteln/rest/blob/main/imags/post_01.png)

![Database with dragon fruit](https://github.com/apusteln/rest/blob/main/imags/db_01png)

And put another one

![PUT](https://github.com/apusteln/rest/blob/main/imags/put_02.png)

![Database with peach](https://github.com/apusteln/rest/blob/main/imags/db_02.png)

Then we can delete some items

![DELETE](https://github.com/apusteln/rest/blob/main/imags/delete_03.png)

![DELETE](https://github.com/apusteln/rest/blob/main/imags/delete_04.png)

And we get to the beginning

![DELETE](https://github.com/apusteln/rest/blob/main/imags/db-04.png)

Additionally the local host page has the same info as the readme file:

![home page](https://github.com/apusteln/rest/blob/main/imags/home_page.png)

---

The project has been done using lua5.1 with luarocks 2.4.2 and the following rocks:
- lapis (1.9.0-1)
- moonscript (0.5.0-1)
- luabitop (1.0.2-3)
- lua-cjason (2.1.0.6-1)
