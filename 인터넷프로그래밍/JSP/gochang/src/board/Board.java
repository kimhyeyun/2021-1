package board;

public class Board {
	private int bdID;
	private String bdTitle;
	private String userID;
	private String bdDate;
	private String bdContent;
	private int bdAvailable;
	
	
	public int getBdID() {
		return bdID;
	}
	public void setBdID(int bdID) {
		this.bdID = bdID;
	}
	public String getBdTitle() {
		return bdTitle;
	}
	public void setBdTitle(String bdTitle) {
		this.bdTitle = bdTitle;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getBdDate() {
		return bdDate;
	}
	public void setBdDate(String bdDate) {
		this.bdDate = bdDate;
	}
	public String getBdContent() {
		return bdContent;
	}
	public void setBdContent(String bdContent) {
		this.bdContent = bdContent;
	}
	public int getBdAvailable() {
		return bdAvailable;
	}
	public void setBdAvailable(int bdAvailable) {
		this.bdAvailable = bdAvailable;
	}
	
	
}
