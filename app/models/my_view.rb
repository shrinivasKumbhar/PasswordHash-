class MyView < ActiveRecord::Base
  self.table_name = 'my_view'
  after_initialize :readonly!
end
