class Player < ApplicationRecord
  validates :first_name, presence: true, length: { minimum: 1 }
  validates :last_name, presence: true, length: { minimum: 1 }
  validates :email, presence: true, email: true
  validates :age, presence: true, inclusion: { in: 1..100 }

  def self.positions
    [
      'forward',
      'right back',
      'right midfielder',
      'defensive midfielder',
      'goalkeeper',
      'striker',
      'left midfielder',
      'left back',
      'stopper',
      'sweeper'
    ]
  end

  validates :position, presence: true,
                       inclusion: { in: Player.positions,
                                    message: "%{value} is not a valid position" }

  def self.search(params)
    query = params[:search]
    unless query.empty?
      where(
        "first_name ILIKE ? or last_name ILIKE ?",
        "%#{query}%",
        "%#{query}%"
      )
    else
      all
    end
  end
end
