# CrawlerDetect  
  
[![Build Status](https://travis-ci.org/loadkpi/crawler_detect.svg?branch=master)](https://travis-ci.org/loadkpi/crawler_detect) [![Gem Version](https://badge.fury.io/rb/crawler_detect.svg)](https://badge.fury.io/rb/crawler_detect)

## About
**CrawlerDetect** is a Ruby version of PHP class @[CrawlerDetect](https://github.com/JayBizzle/Crawler-Detect). 

It helps to detect  bots/crawlers/spiders via the user agent and other HTTP-headers. Currently able to detect 1,000's of bots/spiders/crawlers.
### Why CrawlerDetect?
Comparing with other popular bot-detection gems:

|  | CrawlerDetect | Voight-Kampff | Browser  |
|--|--|--|--|
| Number of bot-patterns | >1000 | ~280 | ~280 |
| Number of checked HTTP-headers | 10 | 1 | 1 |
| Number of updates of bot-list *(1st half of 2018)* | 14 | 1 | 7 |

## Installation
Add this line to your application's Gemfile:

`gem 'crawler_detect'`
## Basic Usage
```
CrawlerDetect.is_crawler?("Bot user agent")
=> true
```
Or if you need crawler name:
```
detector = CrawlerDetect.new("Googlebot/2.1 (http://www.google.com/bot.html)")
detector.is_crawler?
=> true
detector.crawler_name
=> "Googlebot"
```
## Rack::Request extension
**Optionally** you can add additional methods for `request`:
```
request.is_crawler?
=> false
request.crawler_name
=> nil
```
It's more flexible to use `request.is_crawler?` rather than `CrawlerDetect.is_crawler?` because it automatically checks 10 HTTP-headers, not only `HTTP_USER_AGENT`.

Only one thing you have to do is to configure `Rack::CrawlerDetect` midleware:
###  Rails
```
class Application < Rails::Application
  ...
  config.middleware.use Rack::CrawlerDetect
end
```
### Rake
```
use Rack::CrawlerDetect
```
## License
MIT License
