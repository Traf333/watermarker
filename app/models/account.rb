class Account < ActiveRecord::Base

  validates_presence_of :insales_id, :insales_subdomain, :password
end
