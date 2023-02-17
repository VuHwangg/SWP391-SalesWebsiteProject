/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import dal.ImageDBContext;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import model.Cart;
import model.Customer;
import model.Order;

/**
 *
 * @author toden
 */
public class EmailConfig {
    
    public String MessageProduct(Map<Integer, Cart> carts){
        String Message = "";
        ImageDBContext idc = new ImageDBContext();
        helper h = new helper();
        for(Map.Entry<Integer, Cart> cart : carts.entrySet()){
            int Quantity = cart.getValue().getQuantity();
            float Price = (float) cart.getValue().getProduct().getCurrent_price();
            Message+="<tr>\n" +
"                            <td scope=\"col\">\n" +
"                                <img style=\"height: 100px;\" src=\""+ idc.GetImageUrl(cart.getKey()) +">\n" +
"                            </td>\n" +
"                            <td scope=\"col\">"+cart.getValue().getProduct().getName()+ "x" + Quantity + "</td>\n" +
"                            <td class=\"p-0\" scope=\"col\"> <span class=\"d-flex justify-content-end\">"+h.convertBigNum(Price*Quantity) +"</span></td>\n" +
"                    </tr>\n";
        }
        return Message;
    }
    
     
    
    public void SendEmail(String to, float total_price, String messageTo, int ordId) throws AddressException, MessagingException {
    final String username = "awnsshop@gmail.com";
        final String password = "domesnykgatzcmuh";
        helper h = new helper();         
        Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true"); //TLS
        
        Session session = Session.getInstance(prop,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("awnsshop@gmail.com"));
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(to)
            );
            message.setSubject("Testing Gmail TLS");
            message.setContent("<title>OrderLookup</title>\n" +
"    </head>\n" +
"\n" +
"    <body>\n" +
"        <div class=\"container mt-2\">\n" +
"            <div>\n" +
"                <div class=\"row\">\n" +
"                    <div class=\"col-md-6\">\n" +
"                        <h3>AWNSSTORE.COM</h3>\n" +
"                    </div>\n" +
"                    <div class=\"col-md-6 d-flex justify-content-end\">\n" +
"                        <h5>ĐƠN HÀNG "+ordId+"</h5>\n" +
"                    </div>\n" +
"                </div>\n" +
"            </div>\n" +
"\n" +
"            <div>\n" +
"                <h3 class=\"mt-3\">Cám ơn quý khách đã mua hàng tại Awns's Store</h3>\n" +
"                <p>Xin chào, Awns's Store rất vui đã nhận được đơn đặt hàng của quý khách</p>\n" +
"                <p>Chúng tôi sẽ liên hệ lai ngay để xác nhận đơn hàng.</p>\n" +
"            </div>\n" +
"\n" +
"            \n" +
"\n" +
"            <div class=\" border-top border-secondary border-1 my-3\"></div>\n" +
"            <div>\n" +
"                <h3 class=\"mb-3\">Thông tin đơn hàng</h3>\n" +
"            </div>\n" +
"\n" +
"            <div>\n" +
"                <table class=\"table\">\n" +
"                    <tbody>\n" + messageTo +
"                    </tbody>\n" +
"                </table>\n" +
"            </div>\n" +
"            <div>\n" +
"                <div class=\"row\">\n" +
"                    <div class=\"col-6\"></div>\n" +
"                    <div class=\"col-6\">\n" +
"                        <div class=\"row col\">\n" +
"                            <div class=\"col \">Tổng giá trị sản phẩm</div>\n" +
"                            <div class=\"col d-flex justify-content-end fw-bold \">"+total_price+"</div>\n" +
"                        </div>\n" +
"                        <div class=\"row\">\n" +
"                            <div class=\"col \">Khuyến mãi</div>\n" +
"                            <div class=\"col d-flex justify-content-end fw-bold\">0VNĐ</div>\n" +
"                        </div>\n" +
"\n" +
"                        <div class=\"row\">\n" +
"                            <div class=\"col\">Phí vận chuyển</div>\n" +
"                            <div class=\"col d-flex justify-content-end fw-bold\">0VNĐ</div>\n" +
"                        </div>\n" +
"                        <div style=\"max-width: 100%;\" class=\" border-top border-secondary border-1 my-3\"></div>\n" +
"                        <div class=\"row\">\n" +
"                            <div class=\"col\">Tổng cộng</div>\n" +
"                            <div class=\"col d-flex justify-content-end fw-bold fs-3\">"+h.convertBigNum(total_price)+"</div>\n" +
"                        </div>\n" +
"\n" +
"                    </div>\n" +
"                </div>\n" +
"            </div>\n" +
"\n" +
"\n" +
"        </div>\n" +
"\n" +
"        <div>\n" +
"\n" +
"        </div>\n" +
"    </div>","text/html; charset=utf-8");

            Transport.send(message);

            System.out.println("Done");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
