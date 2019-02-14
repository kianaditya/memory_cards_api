class Cards::IndexSerializer < ActiveModel::Serializer
    include Rails.application.routes.url_helpers
    attributes :question, :answer
    belongs_to :user, serializer: Users::UserInfoSerializer
    belongs_to :category, serializer: Categories::CategoriesInfoSerializer
  end