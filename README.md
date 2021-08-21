## users

|------Column-----|------Type-------|------Options----|
|-----------------|-----------------|-----------------|
|email            |string           |null :false      |
|ecrypted_password|string           |null :false      |
|nickname         |string           |null :false      |
|birth_date       |integer          |null :false      |
|first_name       |string           |null :false      |
|family_name      |string           |null :false      |
|first_name_kana  |string           |null :false      |
|family_name_kana |string           |null :false      |
|                 |                 |                 |
|                 |                 |                 |
|                 |                 |                 |
|                 |                 |                 |
|                 |                 |                 |
|-----------------|-----------------|-----------------|

### Association
has_many :items
has_many :orders
has_one :address





## items

|------Column-----|------Type-------|----------------Options------------------|
|-----------------|-----------------|-----------------------------------------|
|item_name        |string           |null :false                              |
|item_text        |text             |null :false                              |
|user_id          |references       |null :false foreign_key :true            |
|item_price       |integer          |null :false                              |
|                 |                 |                                         |
|                 |                 |                                         |
|                 |                 |                                         |
|                 |                 |                                         |
|                 |                 |                                         |
|-----------------|-----------------|-----------------------------------------|

### Association
belongs_to :user
has_one :order



## orders

|------Column-----|------Type-------|----------------Options------------------|
|-----------------|-----------------|-----------------------------------------|
|user_id          |references       |null :false foreign_key :true            |
|item_id          |references       |null :false foreign_key :true            |
|                 |                 |                                         |
|                 |                 |                                         |
|-----------------|-----------------|-----------------------------------------|


### Association
belongs_to :user
belongs_to :item
has_one :address


## addresses

|------Column-----|------Type-------|------------------Options----------------|
|-----------------|-----------------|-----------------------------------------|
|postal_code      |integer          |null :false                              |
|prefecture       |string           |null :false                              |
|city             |string           |null :false                              |
|house_number     |integer          |null :false                              |
|building         |string           |                                         |
|order_id         |references       |null :false foreign_key :true            |
|user_id          |references       |null :false foreign_key :true            |
|phone_number     |integer          |null :false                              |
|                 |                 |                                         |
|                 |                 |                                         |
|                 |                 |                                         |
|                 |                 |                                         |
|                 |                 |                                         |
|-----------------|-----------------|-----------------------------------------|


### Association
belongs_to :user
belongs_to :order