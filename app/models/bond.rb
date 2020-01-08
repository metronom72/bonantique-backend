class Bond < Product
  has_one :specification,
          class_name: "BondSpecification",
          inverse_of: :bond,
          dependent: :destroy,
          autosave: true

  delegate :bond_currency,
           :bond_value,
           :bond_serial,
           :bond_number,
           :bond_country,
           :is_copy,

           :bond_currency=,
           :bond_value=,
           :bond_serial=,
           :bond_number=,
           :bond_country=,
           :is_copy=,
           to: :lazily_built_companion
  validates :bond_currency,
            presence: true
  validates :bond_value,
            presence: true

  default_scope { where(available: true) }

  private
  def lazily_built_companion
    specification || build_specification
  end
end
