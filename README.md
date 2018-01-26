# r404

[![Gem Version](https://badge.fury.io/rb/r404.svg)](https://badge.fury.io/rb/r404) <img src="https://travis-ci.org/jonhue/r404.svg?branch=master" />

An error handler & renderer for Rails.

---

## Table of Contents

* [Installation](#installation)
* [Usage](#usage)
    * [Raising an error](#raising-an-error)
    * [Rendering an error](#rendering-an-error)
        * [Rendering external errors](#rendering-external-errors)
    * [List of all error classes](#list-of-all-error-classes)
* [To Do](#to-do)
* [Contributing](#contributing)
    * [Contributors](#contributors)
    * [Semantic versioning](#semantic-versioning)
* [License](#license)

---

## Installation

r404 works with Rails 5 onwards. You can add it to your `Gemfile` with:

```ruby
gem 'r404'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install r404

If you always want to be up to date fetch the latest from GitHub in your `Gemfile`:

```ruby
gem 'r404', github: 'jonhue/r404'
```

Now run the generator:

    $ rails g r404

Finally add `include R404Controller` to your `ApplicationController` located in `app/controllers/application_controller.rb`.

---

## Usage

### Raising an error

You can raise errors in controllers and views:

```ruby
r404 :not_found

# more specific
r404 404
```

**Note:** The status parameter defaults to `404`.

You are able to pass exception details which will be available in your template:

```ruby
r404 :not_found, 'Here is what went wrong ...'
```

Alternatively you can raise errors from anywhere by raising the [error class](#list-of-all-error-classes) directly:

```ruby
raise R404::NotFound
```

### Rendering an error

r404 automatically looks up templates in the `app/views/r404` directory. The `status` and `exception` (if passed) variables are available in your template.

Often you don't want to render a template, but instead your goal is to redirect back passing an alert. You are able to override error specific methods in your `ApplicationController`:

```ruby
private

def render_r404_access_denied format, status, exception
    format.html { redirect_back fallback_location: root_url, alert: 'You are unauthorized to perform this action' }
end
```

#### Rendering external errors

A lot of errors can be thrown in a Rails application. You can rescue and render them from your `ApplicationController`, here is a very basic configuration:

```ruby
rescue_from CanCan::AccessDenied do |exception|
    render_r404 :access_denied, 403, exception
end
rescue_from ActiveRecord::RecordNotFound, AbstractController::ActionNotFound, ActionController::RoutingError do |exception|
    render_r404 :not_found, 404, exception
end
```

### List of all error classes

* `R404::AccessDenied` (`:access_denied`, `403`)
* `R404::NotFound` (`:not_found`, `404`)

---

## To Do

[Here](https://github.com/jonhue/r404/projects/1) is the full list of current projects.

To propose your ideas, initiate the discussion by adding a [new issue](https://github.com/jonhue/r404/issues/new).

---

## Contributing

We hope that you will consider contributing to r404. Please read this short overview for some information about how to get started:

[Learn more about contributing to this repository](CONTRIBUTING.md), [Code of Conduct](CODE_OF_CONDUCT.md)

### Contributors

Give the people some :heart: who are working on this project. See them all at:

https://github.com/jonhue/r404/graphs/contributors

### Semantic Versioning

r404 follows Semantic Versioning 2.0 as defined at http://semver.org.

## License

MIT License

Copyright (c) 2018 Jonas Hübotter

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
