class ClientSerializer < ActiveModel::Serializer
  attributes :id, :phone_number, :first_name, :surname
  attribute :middle_name, if: -> {!object.middle_name.empty?}
end
