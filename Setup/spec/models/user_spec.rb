require 'rails_helper'
RSpec.describe User do
  # This is our control
  context "With valid attributes" do 
    it "should save" do 
      user = User.new(
        first_name: 'shane',
        last_name: 'chang',
        email: 'schang@codingdojo.com'
      )
      expect(user).to be_valid
    end
  end
  
  context "With invalid attributes" do 
    it "should not save if first_name field is blank" do
      user = User.new(
            first_name: '', 
            last_name: 'chang', 
            email: 'schang@codingdojo.com'
        )
      expect(user).to be_invalid
    end
    
    it "should not save if last_name field is blank" do
      user = User.new(first_name: "Ashley", last_name: "", email: "ash@ash.com")
      expect(user).to be_invalid
    end 
    
    it "should not save if email already exists" do
      user1 = User.create(first_name: "Ashley", last_name: "Bloskas", email: "ash@ash.com")
      user2 = User.new(first_name: "Parker", last_name: "Howell", email: "ash@ash.com")
      expect(user2).to be_invalid
    end
    
    it "should not save if invalid email format" do
      user = User.new(first_name: "Ashley", last_name: "Bloskas", email: "as.com")
      expect(user).to be_invalid
    end
  end
end