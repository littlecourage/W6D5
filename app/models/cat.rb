class Cat < ApplicationRecord 
    COLORS = ['White', 'Black', 'Tabby', 'Calico']
    validates :color, inclusion: {in: COLORS,
    message: 'Not a valid color' }
    validates :sex, inclusion: {in: %w(M, F),
    message: 'Not a valid sex'}


  def age
    current_date = Time.now.year
    current_date - self.birth_date.year
  end

end