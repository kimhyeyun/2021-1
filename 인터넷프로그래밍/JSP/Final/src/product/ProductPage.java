package product;

public class ProductPage {
	int start;
	int end;
	int pcode;
	
	public ProductPage(int start, int end, int pcode) {
		this.start = start;
		this.end = end;
		this.pcode = pcode;
	}
	
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getPcode() {
		return pcode;
	}
	public void setPcode(int pcode) {
		this.pcode = pcode;
	}
	
	
}
