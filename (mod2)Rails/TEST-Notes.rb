

describe 'index page' do
  
end 

require 'rails_helper'

describe 'navigate' do
  before do
    @post = Post.create(title: "My Post", description: "My post desc")
  end

  it 'links to post page' do
    visit posts_path
    expect(page).to have_link(@post.title, href: post_path(@post)) #test link_to show page
  end

  it 'shows the title on the show page in a h1 tag' do
    visit "/posts/#{@post.id}"
    expect(page).to have_css("h1", text: "My Post")
  end

  it 'to post pages' do
    visit "/posts/#{@post.id}"
    expect(page.status_code).to eq(200)
  end

  it 'shows the description on the show page in a p tag' do
    visit "/posts/#{@post.id}"
    expect(page).to have_css("p", text: "My post desc")
  end
end

describe 'form' do
  it 'shows a new form that submits content and redirects and prints out params' do
    visit new_post_path
    fill_in 'title', with: "My post title"
    fill_in 'description', with: "My post description"
    click_on "Submit Post"
    expect(page).to have_content("My post title")
  end

  it 'shows a new form that submits content and redirects and prints out params' do
    @post = Post.create(title: "My Post", description: "My post desc")
    visit edit_post_path(@post)
    fill_in 'post[title]', with: "My edit"
    fill_in 'post[description]', with: "My post description"
    click_on "Update Post"
    expect(page).to have_content("My edit")
  end
end
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
namespace :greeting do
  desc 'outputs hello to the terminal'
  task :hello do
    puts "hello from Rake!"
  end

  desc 'outputs hola to the terminal'
  task :hola do
    puts "hola de Rake!"
  end
end

namespace :db do
  task :environment do
    require_relative './config/environment'
  end

  desc 'migrate changes to your database'
  task :migrate => :environment do  # task dependency
    Student.create_table
  end
end