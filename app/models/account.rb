class Account < ActiveRecord::Base

  validates_presence_of :insales_id, :insales_subdomain, :password


  def authorize
     MyApp.configure_api insales_subdomain, password
  end
end
