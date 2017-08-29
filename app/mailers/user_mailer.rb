class UserMailer < ApplicationMailer

  def invoice(current_user,items,prodacts,order,order_items)
    @current_user=current_user
    @current_user.inspect
    @items=Item.all
    @prodacts=Prodact.all
    @order=order
    @order_items=order_items
    puts"before calling method"
    generatepdf
    puts "===========method calling"
    mail to:current_user.email, subject: "Invoice order"
  end
  def generatepdf
    attachments["invoice.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(:pdf => "invoice", :template => "user_mailer/invoice.html.erb")
    )
  end

end
