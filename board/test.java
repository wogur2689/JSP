package univ;
import java.util.*;

public class test {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
        int xum = 0, num = 0, count = 1;
        int[]array = new int[10];
        int[]sum = new int[10];
        Scanner s = new Scanner(System.in);
        
        for(int i = 0; i<10; i++){
            num = s.nextInt();
            array[i] = num % 42; 
            sum[i] = array[i];
        }
        
        for(int i = 0; i<array.length; i++){
        	for(int j = 0; j<10; j++) {
        		if(array[i] != sum[j]) {
        			count++;
        		} else {
        			count--;
        		}
        	}
        	count++;
        	System.out.print(count + " ");
        }
        if(count == 0) {
        	count = 1; 
        }      
        System.out.println(); 
        System.out.println(count);
	}
}

/*
import java.util.*;

public class Main {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int  xum = 0, num = 0, count = 1, sum = 0;
        int[]array1 = new int[10];
        int[]array2 = new int[10];
        Scanner s = new Scanner(System.in);
        
        for(int i = 0; i<10; i++){
            num = s.nextInt();
            array1[i] = num; 
            xum = array1[i] % 42;
            array2[i] = xum;
        }
        
        for(int i = 0; i<10; i++){
        	for(int j = 0; j<10; j++) {
        		if(array2[i] == array2[j]) {
        			count--;
        		} else {
        			count++;
        		}
        	}
        }
        sum = count/10;
        if(sum == 0) {
        	sum++;
        }
        System.out.println(sum);
    }
}
*/