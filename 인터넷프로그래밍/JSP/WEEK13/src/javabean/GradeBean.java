package javabean;

public class GradeBean {
	private String name;
	private int point;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getGrade() {
		if(point >= 90)
			return "A";
		else if(point >= 80)
			return "B";
		else if(point >= 70)
			return "C";
		else if(point >= 60)
			return "D";
		else
			return "F";
	}
}
