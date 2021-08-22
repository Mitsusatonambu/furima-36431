## users

|------Column-----|------Type-------|------Options------------|
|-----------------|-----------------|-------------------------|
|email            |string           |null :false, unique :true|
|ecrypted_password|string           |null :false              |
|nickname         |string           |null :false              |
|date             |integer          |null :false              |
|first_name       |string           |null :false              |
|family_name      |string           |null :false              |
|first_name_kana  |string           |null :false              |
|family_name_kana |string           |null :false              |
|                 |                 |                         |
|                 |                 |                         |
|                 |                 |                         |
|                 |                 |                         |
|                 |                 |                         |
|-----------------|-----------------|-------------------------|

### Association
has_many :items
has_many :orders





## items

|------Column-----|------Type-------|----------------Options------------------|
|-----------------|-----------------|-----------------------------------------|
|name             |string           |null :false                              |
|text             |text             |null :false                              |
|user             |references       |null :false foreign_key :true            |
|price            |integer          |null :false                              |
|image            |                 |null :false                              |
|category         |                 |                                         |
|status           |                 |                                         |
|delivery_fee     |                 |                                         |
|delivery_date    |                 |                                         |
|district         |                 |                                         |
|-----------------|-----------------|-----------------------------------------|

### Association
belongs_to :user
has_one :order



## orders

|------Column-----|------Type-------|----------------Options------------------|
|-----------------|-----------------|-----------------------------------------|
|user             |references       |null :false foreign_key :true            |
|item             |references       |null :false foreign_key :true            |
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
|postal_code      |string           |null :false                              |
|prefecture       |string           |null :false                              |
|city             |string           |null :false                              |
|house_number     |string           |null :false                              |
|building         |string           |                                         |
|order            |references       |null :false foreign_key :true            |
|phone_number     |string           |null :false                              |
|                 |                 |                                         |
|                 |                 |                                         |
|                 |                 |                                         |
|                 |                 |                                         |
|                 |                 |                                         |
|-----------------|-----------------|-----------------------------------------|


### Association
belongs_to :order