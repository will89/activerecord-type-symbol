require 'active_model'
require 'active_record'
require 'active_record/type/symbol'

ActiveRecord::Type.register(:symbol, ActiveRecord::Type::Symbol)