class OrderProfile
  include ActiveModel::Model
  attr_accessor :zip, :area_id, :city, :address, :building,  :tel, :user_id, :item_id, :token
  
  with_options presence: true do
    validates :tel, numericality: {only_integer: true}
    validates :area_id, :city, :address, :user_id, :item_id, :token
    validates :zip, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :tel, format: {with: /\A\d{10,11}\z/}
    validates :area_id, numericality: { other_than: 1 }
  end

  def save
    @order = Order.create(user_id: user_id, item_id: item_id)
    
    Profile.create(zip: zip, area_id: area_id, city: city, address: address, building: building, tel: tel, order_id: @order.id)
  end
end