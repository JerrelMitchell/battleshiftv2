class RowSerializer < ActiveModel::Serializer
  attributes :name, :data

  def name
    row_letter = object.first.keys.first.first.downcase
    ["row", row_letter].join("_")
  end

  def data
    object.map do |space_data|
      SpaceSerializer.new(space_data.values.first).attributes
    end
  end
end
