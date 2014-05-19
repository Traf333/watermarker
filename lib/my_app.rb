class MyApp < InsalesApi::App
  self.api_key = ENV['API_KEY']
  class << self
    def install shop, token, insales_id
      shop = self.prepare_shop shop
      account = Account.find_by(insales_subdomain: shop)
      if account.present?
        begin
          account.authorize
          InsalesApi::Charge.status
        rescue ActiveResource::UnauthorizedAccess
          account.update_attribute :password, password_by_token(token)
        end
        true
      else
        Account.create! insales_subdomain: shop, password: password_by_token(token), insales_id: insales_id
      end
    end

    def uninstall shop, password
      account = Account.find_by(insales_subdomain: self.prepare_shop(shop))
      return true unless account
      return false if account.password != password

      account.destroy
    end
  end
end