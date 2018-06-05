class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :full_name, :last_name, :email, :age, :position

  def full_name
    "#{object.first_name} #{object.last_name}"
  end
end
