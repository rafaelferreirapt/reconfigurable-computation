import java.util.*;
public class max_min_network_parameterazation
{
static final int N = 32; // N pode ser qualquer valor de 2**R, R = 0,1,2,3,4,5,6,7,8,9,10,... 
static final int p = 5;
static Random rand = new Random();
 public static void main(String[] args)
 {    
      int result, a[] = new int[N];
      for(int x = 0; x < N; x++)
         a[x] = rand.nextInt(50);//Integer.MAX_VALUE);
      for(int i = 0; i < a.length;  i++)  {  System.out.printf("%10d; ",a[i]);
                                             if (((i+1)%5) == 0) System.out.println();      }
      long time=System.nanoTime();                                  
      result = SN(N,a);
      long time_end=System.nanoTime();
      System.out.printf("\n------------------------\nMaximum value = %5d\n\n",result);
      System.out.printf("measured time (in ns): %d\n",time_end-time);
	  System.out.printf("measured time (in microseconds): %.3f\n",(double)(time_end-time)/1000.);
 }
      public static int SN(int N, int a[])
      {	 int tmp;
         for(int k = 0; k < p; k++)  
           for(int i = 0; i < a.length/(int)(Math.pow(2,k+1));  i++)
                    if (a[(int)(Math.pow(2,k+1))*i+(int)(Math.pow(2,k))-1] > a[(int)(Math.pow(2,k+1))*i+(int)(Math.pow(2,k+1)-1)]) 
                    { 
                      tmp = a[(int)(Math.pow(2,k+1))*i+(int)Math.pow(2,k)-1]; 
                      a[(int)(Math.pow(2,k+1))*i+(int)Math.pow(2,k)-1] = a[(int)(Math.pow(2,k+1))*i+(int)(Math.pow(2,k+1)-1)]; 
                      a[(int)(Math.pow(2,k+1))*i+(int)(Math.pow(2,k+1)-1)] = tmp;
                    } 
         return a[N-1];                                       
}
}
