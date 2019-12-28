class Bond < Product
  has_one :specification,
          class_name: "BondSpecification",
          inverse_of: :bond,
          dependent: :destroy,
          autosave: true

  delegate :currency,
           :amount,
           :bond_serial,
           :bond_number,
           :currency=,
           :amount=,
           :bond_serial=,
           :bond_number=,
           to: :lazily_built_companion
  validates :currency,
            presence: true
  validates :amount,
            presence: true

  private
  def lazily_built_companion
    specification || build_specification
  end
end
