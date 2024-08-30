# Samvera::Persona
A simple user management engine that provides the ability for admins to invite users, reset user passwords, archive users, and log in as users.

Samvera::Persona is currently configured to run in Hyku and Avalon applications.


## Installation
Add this line to your application's Gemfile:

```ruby
gem 'samvera-persona'
```

Then execute:
```bash
$ bundle
```

Mount the engine in `config/routes.rb`

```ruby
  mount Samvera::Persona::Engine => '/'
```

Run migrations:
```
$ bundle exec rake db:migrate
```

Add a link to the persona admin section

```erb
<% if defined?(Samvera::Persona) %>
  <% if can? :manage, User %>
    <li class=<%= active_for_controller('samvera/persona/users') %>><%= link_to 'Manage Users', main_app.persona_users_path %></li>
  <% end %>
<% end %>
```

## Requirements
Samvera::Persona requires Rails 6.0 or greater, Devise for user authentication and expects that your application has the Rails default mailer configured.

## How it Works
Once you have Samvera::Persona installed, you will have access to user management features of inviting users, editing user passwords, becoming users, and archiving users. Features are available at the manage users dashboard.

### Invite User 
From the Manage Users dashboard, type email address into the 'Add or Invite user via email' form and click the 'Invite user' button. New users will receive an email to create an account.

### Edit User
From the Manage Users dashboard, click 'Edit' in the 'Action' column. You will be able to reset the user's password.

### Become User
From the Manage Users dashboard, click 'Become' in the 'Action' column. You will now be logged in as the user. This will be helpful for those occasions when you need to see exactly what your user sees. To end the user session, click 'Back to admin' at the top of the page.

### Archive User
From the Manage Users dashboard, click 'Delete'. The user will now be archived. This feature can be disabled by adding the following initializer

```ruby
Samvera::Persona.setup do |config|
  config.soft_delete = false
end
```

### Omniauth Notes
External user edit is currently disabled by default. If you are using omniauth and the common provider column on your user table, edit will be disabled for users with a value in that column.

## Contributing
See
[CONTRIBUTING.md](https://github.com/samvera-labs/samvera-persona/blob/master/CONTRIBUTING.md)
for contributing guidelines.

We encourage everyone to help improve this project.  Bug reports and pull requests are welcome on GitHub at https://github.com/samvera-labs/samvera-persona.

This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

All Contributors should have signed the Hydra Contributor License Agreement (CLA)

## Questions
Questions can be sent to support@notch8.com. Please make sure to include "Samvera::Persona" in the subject line of your email.

## License
The gem is available as open source under the terms of the [Apache 2.0 License](https://opensource.org/licenses/Apache-2.0).
