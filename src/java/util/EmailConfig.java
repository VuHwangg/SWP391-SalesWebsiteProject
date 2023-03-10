/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import dal.ImageDBContext;
import java.sql.SQLException;
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
    
    public String MessageProduct(Map<Integer, Cart> carts) throws SQLException{
        String Message = "";
        ImageDBContext idc = new ImageDBContext();
        Helper h = new Helper();
        for(Map.Entry<Integer, Cart> cart : carts.entrySet()){
            int Quantity = cart.getValue().getQuantity();
            float Price = (float) cart.getValue().getProduct().getCurrent_price();
            Message+="<tr>\n" +
"                            <td scope=\"col\">\n" +
"                                <img style=\"height: 100px;\" src=\""+ idc.getImageUrl(cart.getKey()) +"\">\n" +
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
        Helper h = new Helper();         
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
"                        <h5>????N H??NG "+ordId+"</h5>\n" +
"                    </div>\n" +
"                </div>\n" +
"            </div>\n" +
"\n" +
"            <div>\n" +
"                <h3 class=\"mt-3\">C??m ??n qu?? kh??ch ???? mua h??ng t???i Awns's Store</h3>\n" +
"                <p>Xin ch??o, Awns's Store r???t vui ???? nh???n ???????c ????n ?????t h??ng c???a qu?? kh??ch</p>\n" +
"                <p>Ch??ng t??i s??? li??n h??? lai ngay ????? x??c nh???n ????n h??ng.</p>\n" +
"            </div>\n" +
"\n" +
"            \n" +
"\n" +
"            <div class=\" border-top border-secondary border-1 my-3\"></div>\n" +
"            <div>\n" +
"                <h3 class=\"mb-3\">Th??ng tin ????n h??ng</h3>\n" +
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
"                            <div class=\"col \">T???ng gi?? tr??? s???n ph???m</div>\n" +
"                            <div class=\"col d-flex justify-content-end fw-bold \">"+h.convertBigNum(total_price)+"</div>\n" +
"                        </div>\n" +
"                        <div class=\"row\">\n" +
"                            <div class=\"col \">Khuy???n m??i</div>\n" +
"                            <div class=\"col d-flex justify-content-end fw-bold\">0VN??</div>\n" +
"                        </div>\n" +
"\n" +
"                        <div class=\"row\">\n" +
"                            <div class=\"col\">Ph?? v???n chuy???n</div>\n" +
"                            <div class=\"col d-flex justify-content-end fw-bold\">0VN??</div>\n" +
"                        </div>\n" +
"                        <div style=\"max-width: 100%;\" class=\" border-top border-secondary border-1 my-3\"></div>\n" +
"                        <div class=\"row\">\n" +
"                            <div class=\"col\">T???ng c???ng</div>\n" +
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
