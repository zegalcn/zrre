
### department

```
rails g scaffold department name description:text
```

### employee

```
rails g scaffold employee name description:text
```

### pay_category

```
rails g model pay_category parent:belongs_to name description:text
```

salary/perk/

### pay_element

```
rails g model pay_element name category:belongs_to subcategory:belongs_to
```

### pay

```
rails g model pay department:belongs_to employee:belongs_to year:integer month:integer sum:float
```

### expenses

