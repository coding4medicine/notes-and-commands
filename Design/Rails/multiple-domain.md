multiple domains -

http://stackoverflow.com/questions/4207657/rails-routing-to-handle-multiple-domains-on-single-application

http://stackoverflow.com/questions/24122140/separate-domain-for-namespaced-routes-in-rails-4

http://www.nicolasgarnil.me/blog/2013/handling-multiple-domains-routes-in-ruby-on-rails/

https://zen.id.au/how-to-manage-multiple-domains-subdomains-with-rails-4-on-heroku/

In lib/subdomain.rb:

class Subdomain
  def self.matches?(request)
    request.subdomain.present? && request.subdomain != "www"
  end
end

class Domain
  def self.matches?(request)
    request.domain.present? && request.domain != "mydomain.com"
  end
end


This class is used in routes.rb:

require 'subdomain'
constraints(Domain) do
  match '/' => 'blogs#show'
end

constraints(Subdomain) do
  match '/' => 'blogs#show'
end

