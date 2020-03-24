class LowFundsMailer < ApplicationMailer
    default from: "server@mortgagehippo.com"

    # ActiveRecord Query for all the admins, condense them into "emails" variable
    # joining them with a comma so the email is sent to all the admins
    
    # Also using instance variable @coin here so I can reference it in the body of the email 
    # in the views 
    
    def low_funds(coin)
        @coin = coin
        @admins = User.where(admin: :true)
        emails = @admins.collect(&:email).join(",")
        mail(to: emails, subject: "Low funds for #{@coin.name}")
    end
end
