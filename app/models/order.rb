class Order < ApplicationRecord
include ActiveModel::Model
  attr_accessor :hoge,:fuga...

  belongs_to :user
  belongs_to :item
  has_one :address

  # ここにバリデーションの処理を書く

  def save
    # 各テーブルにデータを保存する処理を書く
  end
end
