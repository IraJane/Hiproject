package order.model;

public class OrderDetail {
	private int od_num ;
	private int r_num  ;
	private int o_count   ;
	private int o_num    ;
	public int getOd_num() {
		return od_num;
	}
	public void setOd_num(int od_num) {
		this.od_num = od_num;
	}
	public int getR_num() {
		return r_num;
	}
	public void setR_num(int r_num) {
		this.r_num = r_num;
	}
	public int getO_count() {
		return o_count;
	}
	public void setO_count(int o_count) {
		this.o_count = o_count;
	}
	public int getO_num() {
		return o_num;
	}
	public void setO_num(int o_num) {
		this.o_num = o_num;
	}
	@Override
	public String toString() {
		return "OrderDetail [od_num=" + od_num + ", r_num=" + r_num + ", o_count=" + o_count + ", o_num=" + o_num + "]";
	}
	public OrderDetail(int od_num, int r_num, int o_count, int o_num) {
		super();
		this.od_num = od_num;
		this.r_num = r_num;
		this.o_count = o_count;
		this.o_num = o_num;
	}
	public OrderDetail() {
		super();
	}
	
	
	
	
	
	
	
}
