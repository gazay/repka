# Repka gem — stats gathering for mongoid

Repka will help you easily gather stats from controllers if you use mongoid

## Usage

`app/controllers/your_controller.rb`

``` ruby
def index
  rep :direct_visits # or inc :direct_visits
  rep :visits, :source if params[:source]
  rep :payed, nil, 3400.99 if params[:payed]
  rep :payed_from, :paypal, 400 if params[:paypal]
  rep :payed_from, :cash, 450.99 if params[:cash]
```

`app/controllers/admin_controller.rb`

``` ruby
def stats
  @all_stats = repka_all_stats
  @today_stats = repka_today_stats
  @some_day_stats = RepkaStorage.first(:conditions => {:date => Date.new(2011,06,24)})
```

## Installation

Puts this line into `Gemfile` then run `$ bundle`:

``` ruby
gem 'repka', '0.0.1'
```

Or if you are old-school Rails 2 developer put this into `config/environment.rb` and run `$ rake gems:install`:

``` ruby
config.gem 'repka', :version => '0.0.1'
```

Or manually install gon gem: `$ gem install repka`

## Contributors

* @gazay

## License

The MIT License

Copyright (c) 2011 gazay

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
