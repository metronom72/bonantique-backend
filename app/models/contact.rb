class Contact < ApplicationRecord
  validates :value, :label, :scope, presence: true
  validates :scope, inclusion: { in: %w(socials phone email) }

  default_scope { where(active: true) }
end
