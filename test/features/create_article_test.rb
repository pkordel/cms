require 'test_helper'

feature "Create article Feature Test" do

  given(:author) {
    User.create email: 'author@example.com', password: '12345678',
                password_confirmation: '12345678', role: 'author'
  }

  given(:editor) {
    User.create email: 'editor@example.com', password: '12345678',
                password_confirmation: '12345678', role: 'editor'
  }

  scenario 'as author create draft' do
    sign_in_user author
    click_button 'New Article'
    fill_in 'article_general_title', with: 'My Title'
    fill_in 'article_general_content', with: 'My text'
    check 'save_as_draft'
    click_button 'Save'
    page.must have_content 'Draft was successfully created.'
  end

  scenario 'as author submit article for review' do
    sign_in_user author
    click_button 'New Article'
    fill_in 'article_general_title', with: 'My Title'
    fill_in 'article_general_content', with: 'My text'
    click_button 'Save'
    page.must have_content 'Article was successfully submitted.'
  end

  scenario 'as editor publish an article' do
    sign_in_user editor
    click_button 'New Article'
    fill_in 'article_general_title', with: 'My Title'
    fill_in 'article_general_content', with: 'My text'
    click_button 'Save'
    page.must have_content 'Article was successfully published.'
  end
end
