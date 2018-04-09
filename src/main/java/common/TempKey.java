package common;

import java.util.Random;

/*
* 
 * 인증키를 생성
 * 
 * 
 * 
 * 
 * */
public class TempKey {

    private boolean lowerCheck;
    private int size;

    public String getKey(int size, boolean lowerCheck) {
        this.size = size;
        this.lowerCheck = lowerCheck;
        return init();
    }

    private String init() {
        Random  ran = new Random();
        StringBuffer sb = new StringBuffer();
        int num = 0;
        do {
            num = ran.nextInt(75)+48;
            if((num>=48 && num<=57) || (num>=65 && num<=90) || (num>=97 && num<=122)) {
                sb.append((char)num);
            }else {
                continue;
            }
        } while (sb.length() < size);
        if(lowerCheck) {
            return sb.toString().toLowerCase();
        }
        return sb.toString();
    }
    public static int generateNumber(int length) {

        String numStr = "1";
        String plusNumStr = "1";

        for (int i = 0; i < length; i++) {
            numStr += "0";

            if (i != length - 1) {
                plusNumStr += "0";
            }
        }

        Random random = new Random();
        int result = random.nextInt(Integer.parseInt(numStr)) + Integer.parseInt(plusNumStr);

        if (result > Integer.parseInt(numStr)) {
            result = result - Integer.parseInt(plusNumStr);
        }

        return result;
    }
}
