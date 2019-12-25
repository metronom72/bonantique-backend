class Subscription < ApplicationRecord
  validates :email, presence: { message: 'Введите E-mail' },
                    uniqueness: { message: 'Такой E-mail уже подписан. Введите другой' },
                    format: { with: /.*@.*/, message: 'Введен неверный E-mail'}
end
