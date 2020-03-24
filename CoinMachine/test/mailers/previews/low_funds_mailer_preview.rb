# Preview all emails at http://localhost:3000/rails/mailers/low_funds_mailer
class LowFundsMailerPreview < ActionMailer::Preview
    def low_funds_email_preview
        LowFundsMailer.low_funds(Coin.where(name: "BCoin")[0])
    end
end
