class InventoryMailer < ApplicationMailer
 default from: 'mp10kgn@gmail.com'

    def inventory_email(supplier)
        @supplier = supplier
        mail(to: @supplier.email, subject: 'Your Inventory Is Created')
    end
end
