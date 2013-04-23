# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

author  = User.create email: 'author@example.com', password: '12345678', password_confirmation: '12345678', role: 'author'
editor  = User.create email: 'editor@example.com', password: '12345678', password_confirmation: '12345678', role: 'editor'
auth_ed = User.create email: 'auth@example.com',   password: '12345678', password_confirmation: '12345678', role: 'authoritative_editor'

Taxonomy.create(
  [
    { name: 'Medicin', authoritative_editor: auth_ed ,
      parent: Taxonomy.create(name: 'Nature and Technoloy', authoritative_editor: auth_ed) },
    { name: 'Geography', authoritative_editor: auth_ed,
      parent: Taxonomy.create(name: 'Society and History', authoritative_editor: auth_ed) },
    { name: 'Music', authoritative_editor: auth_ed,
      parent: Taxonomy.create(name: 'Art and Culture', authoritative_editor: auth_ed) }
  ])
