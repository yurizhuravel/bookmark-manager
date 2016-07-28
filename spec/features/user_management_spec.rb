require 'web_helper'

feature "User sign up" do
  scenario "New users can sign up" do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, alice@wonderland.com')
    expect(User.first.email).to eq('alice@wonderland.com')
  end

  scenario "require a matching confirmation password" do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  scenario "with a password that doesnt match" do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq ('/users')# current_path is a helper provided by Capybara
    expect(page).to have_content "Password and confirmation password don't match"
  end

  scenario "I can't sign up without an email address" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
  end

  scenario "I can't sign up with an invalid email address" do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
  end
end
