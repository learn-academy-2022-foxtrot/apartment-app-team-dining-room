require "rails_helper"

RSpec.describe "Apartments", type: :request do
  let(:user) { User.create email: "test@example.com", password: "password", password_confirmation: "password" }

  # -----index-----
  describe "GET /index" do
    it "gets all the apartments" do
      apartment = user.apartments.new(
        street: "124 Conch Street",
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
      apartment.save
      get "/apartments"

      apartments = JSON.parse(response.body)
      expect(apartments.length).to eq 1
      expect(response).to have_http_status(200)
      apartment = apartments.first
      expect(apartment["street"]).to eq "124 Conch Street"
      expect(apartment["city"]).to eq "Bikini Bottom"
      expect(apartment["state"]).to eq "Pacific Ocean"
      expect(apartment["manager"]).to eq "Mustachio Jones"
      expect(apartment["email"]).to eq "mjones@example.com"
    end
  end
  # -----create-----
  describe "POST /create" do
    it "creates a new apartment" do
      apartment_params = {
        apartment: {
          street: "221B Baker Street",
          city: "London",
          state: "England",
          manager: "Ms. Hudson",
          email: "mzhud@email.com",
          price: "1500",
          bedrooms: 2,
          bathrooms: 2,
          pets: "yes",
          image: "https://img.zumpercdn.com/523001002/1280x960?fit=crop&h=135&w=414",
          user_id: user.id
        }
      }

      post "/apartments", params: apartment_params

      apartment_response = JSON.parse(response.body)
      expect(apartment_response["street"]).to eq "221B Baker Street"
      expect(apartment_response["city"]).to eq "London"
      expect(apartment_response["state"]).to eq "England"
      expect(apartment_response["manager"]).to eq "Ms. Hudson"
      expect(apartment_response["email"]).to eq "mzhud@email.com"
      expect(apartment_response["price"]).to eq "1500"
      expect(apartment_response["bedrooms"]).to eq 2
      expect(apartment_response["bathrooms"]).to eq 2
      expect(apartment_response["pets"]).to eq "yes"
      expect(apartment_response["image"]).to eq "https://img.zumpercdn.com/523001002/1280x960?fit=crop&h=135&w=414"
      expect(apartment_response["user_id"]).to eq user.id
    end

    it "cannot create a new apartment without a street" do
      apartment_params = {
        apartment: {
          city: "London",
          state: "England",
          manager: "Ms. Hudson",
          email: "mzhud@email.com",
          price: "1500",
          bedrooms: 2,
          bathrooms: 2,
          pets: "yes",
          user_id: user.id
        }
      }
      post "/apartments", params: apartment_params
      error_response = JSON.parse(response.body)
      expect(error_response["street"]).to include "can't be blank"
      expect(response).to have_http_status(422)
    end

    it "cannot create a new apartment without a city" do
      apartment_params = {
        apartment: {
          street: "221B Baker Street",
          state: "England",
          manager: "Ms. Hudson",
          email: "mzhud@email.com",
          price: "1500",
          bedrooms: 2,
          bathrooms: 2,
          pets: "yes",
          user_id: user.id
        }
      }
      post "/apartments", params: apartment_params
      error_response = JSON.parse(response.body)
      expect(error_response["city"]).to include "can't be blank"
      expect(response).to have_http_status(422)
    end

    it "cannot create a new apartment without a state" do
      apartment_params = {
        apartment: {
          street: "221B Baker Street",
          city: "London",
          manager: "Ms. Hudson",
          email: "mzhud@email.com",
          price: "1500",
          bedrooms: 2,
          bathrooms: 2,
          pets: "yes",
          user_id: user.id
        }
      }
      post "/apartments", params: apartment_params
      error_response = JSON.parse(response.body)
      expect(error_response["state"]).to include "can't be blank"
      expect(response).to have_http_status(422)
    end

    it "cannot create a new apartment without a manager" do
      apartment_params = {
        apartment: {
          street: "221B Baker Street",
          city: "London",
          state: "England",
          email: "mzhud@email.com",
          price: "1500",
          bedrooms: 2,
          bathrooms: 2,
          pets: "yes",
          user_id: user.id
        }
      }
      post "/apartments", params: apartment_params
      error_response = JSON.parse(response.body)
      expect(error_response["manager"]).to include "can't be blank"
      expect(response).to have_http_status(422)
    end

    it "cannot create a new apartment without an email" do
      apartment_params = {
        apartment: {
          street: "221B Baker Street",
          city: "London",
          state: "England",
          manager: "Ms. Hudson",
          price: "1500",
          bedrooms: 2,
          bathrooms: 2,
          pets: "yes",
          user_id: user.id
        }
      }
      post "/apartments", params: apartment_params
      error_response = JSON.parse(response.body)
      expect(error_response["email"]).to include "can't be blank"
      expect(response).to have_http_status(422)
    end

    it "cannot create a new apartment without a price" do
      apartment_params = {
        apartment: {
          street: "221B Baker Street",
          city: "London",
          state: "England",
          manager: "Ms. Hudson",
          email: "mzhud@email.com",
          bedrooms: 2,
          bathrooms: 2,
          pets: "yes",
          user_id: user.id
        }
      }
      post "/apartments", params: apartment_params
      error_response = JSON.parse(response.body)
      expect(error_response["price"]).to include "can't be blank"
      expect(response).to have_http_status(422)
    end

    it "cannot create a new apartment without bedrooms" do
      apartment_params = {
        apartment: {
          street: "221B Baker Street",
          city: "London",
          state: "England",
          manager: "Ms. Hudson",
          email: "mzhud@email.com",
          price: "1500",
          bathrooms: 2,
          pets: "yes",
          user_id: user.id
        }
      }
      post "/apartments", params: apartment_params
      error_response = JSON.parse(response.body)
      expect(error_response["bedrooms"]).to include "can't be blank"
      expect(response).to have_http_status(422)
    end

    it "cannot create a new apartment without bathrooms" do
      apartment_params = {
        apartment: {
          street: "221B Baker Street",
          city: "London",
          state: "England",
          manager: "Ms. Hudson",
          email: "mzhud@email.com",
          price: "1500",
          bedrooms: 2,
          pets: "yes",
          user_id: user.id
        }
      }
      post "/apartments", params: apartment_params
      error_response = JSON.parse(response.body)
      expect(error_response["bathrooms"]).to include "can't be blank"
      expect(response).to have_http_status(422)
    end

    it "cannot create a new apartment without pets" do
      apartment_params = {
        apartment: {
          street: "221B Baker Street",
          city: "London",
          state: "England",
          manager: "Ms. Hudson",
          email: "mzhud@email.com",
          price: "1500",
          bedrooms: 2,
          bathrooms: 2,
          user_id: user.id
        }
      }
      post "/apartments", params: apartment_params
      error_response = JSON.parse(response.body)
      expect(error_response["pets"]).to include "can't be blank"
      expect(response).to have_http_status(422)
    end
  end

  #--- Delete ---
  describe "DELETE /destroy" do
    it "deletes an apartment" do
      Apartment.create(
        id: 1,
        street: "124 Conch Street",
        city: "Bikini Bottom",
        state: "Pacific Ocean",
        manager: "Mustachio Jones",
        email: "mjones@example.com",
        price: "1000 sand dollars",
        bedrooms: 2,
        bathrooms: 2,
        pets: "yes",
        image: "https://images.thedailystar.net/sites/default/files/styles/very_big_201/public/feature/images/who_lives_in_a_pineapple_under_the_sea.jpg?itok=iYr37hhG",
        user_id: user.id
      )

      delete apartment_path(1)
      expect(response).to have_http_status(200)
    end
  end

  #--- Update ---
  describe "UPDATE /patch" do
    it "Updates an apartment" do
      # CREATE
      Apartment.create(
        id: 1,
        street: "124 Conch Street",
        city: "Bikini Bottom",
        state: "Pacific Ocean",
        manager: "Mustachio Jones",
        email: "mjones@example.com",
        price: "1000 sand dollars",
        bedrooms: 2,
        bathrooms: 2,
        pets: "yes",
        image: "https://images.thedailystar.net/sites/default/files/styles/very_big_201/public/feature/images/who_lives_in_a_pineapple_under_the_sea.jpg?itok=iYr37hhG",
        user_id: user.id
      )

      # Send a request to server
      patch apartment_path(1, params: {
        apartment: {
          id: 1,
          street: "PATCH Conch Street",
          city: "PATCH Bikini Bottom",
          state: "PATCH Pacific Ocean",
          manager: "PATCH Mustachio Jones",
          email: "PATCH mjones@example.com",
          price: "PATCH 1000 sand dollars",
          bedrooms: 1,
          bathrooms: 1,
          pets: "No",
          image: "https://images.thedailystar.net/sites/default/files/styles/very_big_201/public/feature/images/who_lives_in_a_pineapple_under_the_sea.jpg?itok=iYr37hhG",
          user_id: user.id
        }
      })

      # Assure we get good code back
      expect(response).to have_http_status(200)

      # Look up the cat we created
      apartment = Apartment.first

      # Check to see if cat has the same attribute that were given
      expect(apartment.street).to eq "PATCH Conch Street"
    end
  end
end
