package com.gaon.mail;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import com.gaon.cinema.code.CodeDTO;
 
@Component
public class EmailSender  {
     
    @Autowired
    protected JavaMailSender  mailSender;
 
    public void SendEmail(Email email) throws Exception {
         
        MimeMessage msg = mailSender.createMimeMessage();
        msg.setSubject(email.getSubject());
        msg.setText(email.getContent());
        msg.setRecipient(RecipientType.TO , new InternetAddress(email.getReciver()));
         
        mailSender.send(msg); 
    }
    public void codeSenderEmail(Email email) throws Exception {
    	MimeMessage msg = mailSender.createMimeMessage();
    	msg.setSubject("가온시네마 스토어 구매목록입니다.");
    	msg.setText("구매자 성함 " + email.getSenderName()+"\n"+
    	"구매자 Email " + email.getSenderEmail() + "\n" + 
    	"사용자 성함 " + email.getUserName() +"\n" +
    	"사용자 이메일 " + email.getUserEmail()+"\n" +
    	"상품 이름 " + email.getItem_name()+"\n" +
    	"상품 가격 " + email.getPrice_sale()+"원\n" +
    	"상품 수량 " + email.getBuycount()+"개\n" +
    	"사용 포인트 " + email.getGetPoint()+"point\n" + 
    	"잔여 포인트 " + email.getMyPoint()+"point\n" +
    	"상품 총금액 " + email.getTotal()+"원\n" +
    	"할인 금액" + email.getGetPoint()+"point\n" + 
    	"최종 결제 금액" + email.getBuyMoney() + "원"
    	);
    	msg.setRecipient(RecipientType.TO , new InternetAddress(email.getSenderEmail()));
    	mailSender.send(msg); 
    }
		public void codeReciverEmail(Email email, CodeDTO codeDto,String a,String b) throws Exception{
			// TODO Auto-generated method stub
			MimeMessage msg = mailSender.createMimeMessage();
    	msg.setSubject("가온시네마 스토어 구매목록입니다.");
    	msg.setText("구매자 성함 " + email.getSenderName()+"\n"+
    	"구매자 Email " + email.getSenderEmail() + "\n" + 
    	"사용자 성함 " + email.getUserName() +"\n" +
    	"사용자 이메일 " + email.getUserEmail()+"\n" +
    	"쿠폰 이름" + codeDto.getTitle()+"\n" + 
    	"쿠폰 갯수" + codeDto.getSupply()+"\n" +
    	"쿠폰 번호" + codeDto.getCode_name()+"\n" +
    	"사용 기한" + a+" ~ " + b+" 까지 " 
    	);
    	msg.setRecipient(RecipientType.TO , new InternetAddress(email.getUserEmail()));
    	mailSender.send(msg); 
		}
}
    	