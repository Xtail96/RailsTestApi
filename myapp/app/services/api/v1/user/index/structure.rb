require 'dry-types'
require 'dry-struct'

Dry::Types.load_extensions(:maybe)
module Types
  include Dry::Types.module
end

class Api::V1::User::Index::Structure < Dry::Struct
  constructor_type :schema
end