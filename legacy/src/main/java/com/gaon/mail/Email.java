package com.gaon.mail;
public class Email {
		private String subject;
		private String content;
		private String regdate;
		private String reciver;
		private int store_id;
		private int buycount;
		private int myPoint;
		private int supply;
		private int total;
		private String type;
		private String senderName;
		private String senderEmail;
		private String userName;
		private String userEmail;
		private int getPoint;
		private String buyMoney;
		private String codeType;
		private int price_sale;
		private String item_name;
		public int getStore_id() {
			return store_id;
		}
		public void setStore_id(int store_id) {
			this.store_id = store_id;
		}
		public int getTotal() {
			return total;
		}
		public void setTotal(int total) {
			this.total = total;
		}
    public String getItem_name() {
			return item_name;
		}
		public void setItem_name(String item_name) {
			this.item_name = item_name;
		}
    public int getMyPoint() {
			return myPoint;
		}
		public void setMyPoint(int myPoint) {
			this.myPoint = myPoint;
		}
		public int getBuycount() {
			return buycount;
		}
		public void setBuycount(int buycount) {
			this.buycount = buycount;
		}
    public int getPrice_sale() {
			return price_sale;
		}
		public void setPrice_sale(int price_sale) {
			this.price_sale = price_sale;
		}
		public String getCodeType() {
			return codeType;
		}
		public void setCodeType(String codeType) {
			this.codeType = codeType;
		}
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		}
		public String getSenderName() {
			return senderName;
		}
		public void setSenderName(String senderName) {
			this.senderName = senderName;
		}
		public String getSenderEmail() {
			return senderEmail;
		}
		public void setSenderEmail(String senderEmail) {
			this.senderEmail = senderEmail;
		}
		public String getUserName() {
			return userName;
		}
		public void setUserName(String userName) {
			this.userName = userName;
		}
		public String getUserEmail() {
			return userEmail;
		}
		public void setUserEmail(String userEmail) {
			this.userEmail = userEmail;
		}
		public int getGetPoint() {
			return getPoint;
		}
		public void setGetPoint(int getPoint) {
			this.getPoint = getPoint;
		}
		public String getBuyMoney() {
			return buyMoney;
		}
		public void setBuyMoney(String buyMoney) {
			this.buyMoney = buyMoney;
		}
		public String getReciver() {
        return reciver;
    }
    public void setReciver(String reciver) {
        this.reciver = reciver;
    }
    public String getSubject() {
        return subject;
    }
    public void setSubject(String subject) {
        this.subject = subject;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public String getRegdate() {
        return regdate;
    }
    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }
    public int getSupply() {
    	return supply;
    }
    public void setSupply(int supply) {
    	this.supply = supply;
    }
}