# Jekyll Maps

[![Gem Version](https://badge.fury.io/rb/jekyll-maps.svg)](https://badge.fury.io/rb/jekyll-maps)
[![Build Status](https://travis-ci.org/ayastreb/jekyll-maps.svg?branch=master)](https://travis-ci.org/ayastreb/jekyll-maps)
[![Code Climate](https://codeclimate.com/github/ayastreb/jekyll-maps/badges/gpa.svg)](https://codeclimate.com/github/ayastreb/jekyll-maps)
[![Test Coverage](https://codeclimate.com/github/ayastreb/jekyll-maps/badges/coverage.svg)](https://codeclimate.com/github/ayastreb/jekyll-maps/coverage)
[![Dependency Status](https://gemnasium.com/badges/github.com/ayastreb/jekyll-maps.svg)](https://gemnasium.com/github.com/ayastreb/jekyll-maps)

Easily embed Google Maps with locations from your Jekyll posts, pages or data files.

## Installation

1. Add the following to your site's `Gemfile`:

  ```ruby
  gem 'jekyll-maps'
  ```

2. Add the following to your site's `_config.yml`:

  ```yml
  gems:
    - jekyll-maps
  ```

## Usage

First, add location information to your posts YAML front-matter:

  ```yml
  location:
    latitude: 51.5285582
    longitude: -0.2416807
  ```

Alternatively, you can add location info to your custom collection's documents or even in data files:

  ```yml
  - title: Paris
    url: http://google.fr
    location:
      latitude: 48.8587741
      longitude: 2.2074741
  
  - title: Madrid
    url: http://google.es
    location:
      latitude: 40.4378698
      longitude: -3.8196204
  ```
  
When you have your data ready, just add following tag to the page where you want to see the map:

  ```
  {% google_map %}
  ```
  
You can configure map's dimensions and assign custom CSS class to the element:

  ```
  {% google_map width:100% height:400 class:my-map %}
  ```

You can also filter which locations to display on the map!

For instance, following tag will only display points from documents which have `lang: en` in their front-matter data.

  ```
  {% google_map lang:en %}
  ```

If you have any questions or proposals - open up an [issue](https://github.com/ayastreb/jekyll-maps/issues/new)!

## Contributing

1. Fork it (https://github.com/ayastreb/jekyll-maps/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request