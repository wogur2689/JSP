package univ;

public class test2 {
	
	public void as() {
		
	}
	public static void main(String[] args) {
		int a, b, sum, p;
		boolean[] num = new boolean[10001];
		
		for(int i = 1; i<=10001; i++) {
			a = i;
			sum = a;
			while(a != 0) {
				sum += a%10;
				a = a/10;
			}
			if(sum<=10000) {
				num[sum] = true;
			}
		}
		
		p = 1;
		while(p<=10000) {
			if(num[p] != true) System.out.println(p);
			p++;
		}
	}
}

