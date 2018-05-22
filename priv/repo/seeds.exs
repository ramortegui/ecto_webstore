alias WebStore.{Repo, Tag, Role, User, Category, ProductStatus, Product}

role_member = %Role{name: "member"}
role1 = Repo.insert!(role_member)

role_admin = %Role{name: "admin"}
role2 = Repo.insert!(role_admin)

user = %User{email: "user@domain.com", first_name: "Ruben", last_name: "Amortegui",active: true, roles: [role1, role2]}

user_changeset = User.changeset(user)
Repo.insert(user_changeset)

tag = %Tag{name: "cleareance"}
tag = Repo.insert!(tag)

category = %Category{name: "indoor"}
category = Repo.insert!(category)

product_status = %ProductStatus{name: "active"}
product_status = Repo.insert!(product_status)

product = %Product{ sku: "su01", name: "test", description: "test d", regular_price: 2.0, discount_price: 1.0, quantity: 10, taxable: true, tags: [tag], categories: [category], product_status: product_status }
product_changeset = Product.changeset(product)
Repo.insert(product_changeset)



