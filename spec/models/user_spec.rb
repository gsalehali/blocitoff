require 'support/model_helper'

describe User do
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  ## Attributes
  it_behaves_like "it has attributes", User,
  {
    id: :integer,
    name: :string,
    email: :string,
    encrypted_password: :string,
    reset_password_token: :string,
    reset_password_sent_at: :datetime,
    remember_created_at: :datetime,
    sign_in_count: :integer,
    current_sign_in_at: :datetime,
    last_sign_in_at: :datetime,
    current_sign_in_ip: :string,
    last_sign_in_ip: :string,
    confirmation_token: :string,
    confirmed_at: :datetime,
    confirmation_sent_at: :datetime,
    unconfirmed_email: :string,
    created_at: :datetime,
    updated_at: :datetime
  } {}

  ## Validations

  ## Class Methods

  ## Instance Methods

end
