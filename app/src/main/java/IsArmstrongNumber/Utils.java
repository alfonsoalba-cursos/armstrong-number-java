package IsArmstrongNumber;

import java.util.Stack;

public class Utils {

    public static Boolean IsArmstrongNumber(Integer numb){
        Stack<Integer> stack = new Stack<Integer>();
        Integer j, remainder, temp, count, value = 0;
        temp=numb;
        count=0;
        while(numb >0)   {
            remainder=numb%10;
            stack.push(remainder);
            count++;
            numb=numb/10;
        };
        numb=temp;
        value=0;
        while(!stack.empty())   {
            j=stack.pop();
            value=value + (int) Math.pow(j,count);

        }

        if(value.equals(numb)) {
            return true;
        } else {
            return false;
        }
    }

}
