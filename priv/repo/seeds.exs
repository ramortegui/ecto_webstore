alias WebStore.{Repo, Tag, Role, User, Category, ProductStatus, Product, Coupon}

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

start_date = %DateTime{ year: 2018, month: 05, day: 01, hour: 12, minute: 30, second: 20, time_zone: "America/Edmonton", utc_offset: 0, std_offset: 0, zone_abbr: "MDT"}

end_date = %DateTime{ year: 2018, month: 05, day: 05, hour: 12, minute: 30, second: 20, time_zone: "America/Edmonton", utc_offset: 0, std_offset: 0, zone_abbr: "MDT"}

coupon = %Coupon{ code: "ASDF", active: true, value: 0.0, multiple: true}
coupon_changeset = Coupon.changeset(coupon)
