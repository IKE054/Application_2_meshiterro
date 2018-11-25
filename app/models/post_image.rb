class PostImage < ApplicationRecord

	belongs_to :user
  attachment :image # ここを追加（_idは含めません）
end
