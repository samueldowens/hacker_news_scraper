require './environment.rb'

    use Kernel.const_get("Hacker_News_Scraper_App")
    use Rack::Static, :root => 'public', :urls => ['/']
    run Hacker_News_Scraper_App