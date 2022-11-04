require "rails_helper"

RSpec.describe Apartment, type: :model do
  let(:user) { User.create email: "test@example.com", password: "password", password_confirmation: "password" }

  it "should have a valid street" do
    apartment = user.apartments.new(
      city: "Bikini Bottom",
      state: "Pacific Ocean",
      manager: "Mustachio Jones",
      email: "mjones@example.com",
      price: "1000 sand dollars",
      bedrooms: 2,
      bathrooms: 2,
      pets: "yes",
      image: "https://images.thedailystar.net/sites/default/files/styles/very_big_201/public/feature/images/who_lives_in_a_pineapple_under_the_sea.jpg?itok=iYr37hhG"
    )
    apartment.validate
    expect(apartment.errors[:street]).to include "can't be blank"
  end

  it "is not valid without city" do
    test = Apartment.create street: "Peidmont Avenue", state: "GA", manager: "Scully", email: "scully.person@gmail.com", price: "$2,300", bedrooms: 3, bathrooms: 2, pets: "Cats and Dogs", image: "https://images1.apartments.com/i2/T-bZau3RhTVapgl8eyXgibxs9PAyYBm9A9E0kT42NUg/113/1824-defoor-atlanta-ga-primary-photo.jpg?p=1", user_id: 1
    expect(test.errors[:city]).to_not be_empty
  end

  it "is not valid without state" do
    test = Apartment.create street: "Peidmont Avenue", city: "bikini bottom", manager: "Scully", email: "scully.person@gmail.com", price: "$2,300", bedrooms: 3, bathrooms: 2, pets: "Cats and Dogs", image: "https://images1.apartments.com/i2/T-bZau3RhTVapgl8eyXgibxs9PAyYBm9A9E0kT42NUg/113/1824-defoor-atlanta-ga-primary-photo.jpg?p=1", user_id: 1
    expect(test.errors[:state]).to_not be_empty
  end

  it "is not valid without manager" do
    test = Apartment.create street: "Peidmont Avenue", city: "bikini bottom", state: "GA", email: "scully.person@gmail.com", price: "$2,300", bedrooms: 3, bathrooms: 2, pets: "Cats and Dogs", image: "https://images1.apartments.com/i2/T-bZau3RhTVapgl8eyXgibxs9PAyYBm9A9E0kT42NUg/113/1824-defoor-atlanta-ga-primary-photo.jpg?p=1", user_id: 1
    expect(test.errors[:manager]).to_not be_empty
  end

  it "is not valid without email" do
    test = Apartment.create street: "Peidmont Avenue", city: "bikini bottom", state: "GA", manager: "Mr krabs", price: "$2,300", bedrooms: 3, bathrooms: 2, pets: "Cats and Dogs", image: "https://images1.apartments.com/i2/T-bZau3RhTVapgl8eyXgibxs9PAyYBm9A9E0kT42NUg/113/1824-defoor-atlanta-ga-primary-photo.jpg?p=1", user_id: 1
    expect(test.errors[:email]).to_not be_empty
  end

  it "is not valid without price" do
    test = Apartment.create street: "Peidmont Avenue", city: "bikini bottom", state: "GA", manager: "Mr krabs", email: "scully.person@gmail.com", bedrooms: 3, bathrooms: 2, pets: "Cats and Dogs", image: "https://images1.apartments.com/i2/T-bZau3RhTVapgl8eyXgibxs9PAyYBm9A9E0kT42NUg/113/1824-defoor-atlanta-ga-primary-photo.jpg?p=1", user_id: 1
    expect(test.errors[:price]).to_not be_empty
  end

  it "is not valid without bedrooms" do
    test = Apartment.create street: "Peidmont Avenue", city: "bikini bottom", state: "GA", manager: "Mr krabs", email: "scully.person@gmail.com", price: "$1", bathrooms: 2, pets: "Cats and Dogs", image: "https://images1.apartments.com/i2/T-bZau3RhTVapgl8eyXgibxs9PAyYBm9A9E0kT42NUg/113/1824-defoor-atlanta-ga-primary-photo.jpg?p=1", user_id: 1
    expect(test.errors[:bedrooms]).to_not be_empty
  end

  it "is not valid without bathrooms" do
    test = Apartment.create street: "Peidmont Avenue", city: "bikini bottom", state: "GA", manager: "Mr krabs", email: "scully.person@gmail.com", price: "$1", bedrooms: 3, pets: "Cats and Dogs", image: "https://images1.apartments.com/i2/T-bZau3RhTVapgl8eyXgibxs9PAyYBm9A9E0kT42NUg/113/1824-defoor-atlanta-ga-primary-photo.jpg?p=1", user_id: 1
    expect(test.errors[:bathrooms]).to_not be_empty
  end

  it "is not valid without pets" do
    test = Apartment.create city: "Atlanta", state: "GA", manager: "Scully", email: "scully.person@gmail.com", price: "$2,300", bedrooms: 3, bathrooms: 2, street: "Peidmont Avenue", image: "https://images1.apartments.com/i2/T-bZau3RhTVapgl8eyXgibxs9PAyYBm9A9E0kT42NUg/113/1824-defoor-atlanta-ga-primary-photo.jpg?p=1", user_id: 1
    expect(test.errors[:pets]).to_not be_empty
  end

  it "is not valid without image" do
    test = Apartment.create city: "Atlanta", state: "GA", manager: "Scully", email: "scully.person@gmail.com", price: "$2,300", bedrooms: 3, bathrooms: 2, pets: "Cats and Dogs", street: "Peidmont Avenue", user_id: 1
    expect(test.errors[:image]).to_not be_empty
  end

  it "is not valid without user_id" do
    test = Apartment.create city: "Atlanta", state: "GA", manager: "Scully", email: "scully.person@gmail.com", price: "$2,300", bedrooms: 3, bathrooms: 2, pets: "Cats and Dogs", image: "https://images1.apartments.com/i2/T-bZau3RhTVapgl8eyXgibxs9PAyYBm9A9E0kT42NUg/113/1824-defoor-atlanta-ga-primary-photo.jpg?p=1", street: "Peidmont Avenue"
    expect(test.errors[:user_id]).to_not be_empty
  end
end
