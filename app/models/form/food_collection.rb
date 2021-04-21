class Form::FoodCollection < Form::Base
  FORM_COUNT = 10 #ここで、作成したい登録フォームの数を指定
  attr_accessor :foods

  def initialize(attributes = {})
    super attributes
    self.foods = FORM_COUNT.times.map { User.current.foods.new() } unless self.foods.present?
  end

  def foods_attributes=(attributes)
    self.foods = attributes.map { |_, v| User.current.foods.new(v) }
  end

  def save
    Food.transaction do
      self.foods.map do |food|
        food.save
      end
    end
      return true
    rescue => e
      return false
  end
end
