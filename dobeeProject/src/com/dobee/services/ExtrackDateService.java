package com.dobee.services;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
public class ExtrackDateService {

	
    /* 날짜 형식을 추출하는 함수. 아래 형태의 숫자를 추출
     * 
     * 0000-00-00
     * 0000.00.00
     * 0000/00/00
     * 0000 00 00
     * 
     * http://stackoverflow.com/questions/18591242/java-extract-date-from-string-using-regex-failing 
     * 
     */
    public List<String> extractDate(String str) {

        List<String> list = new ArrayList<String>();
        
        Matcher matcher ;
        
        if (str.isEmpty()) {
            matcher = null;
        } else {
            String patternStr = "(19|20)\\d{2}[- /.]*(0[1-9]|1[012])[- /.]*(0[1-9]|[12][0-9]|3[01])"; // 날자를 패턴으로 지정
            
            int flags = Pattern.MULTILINE | Pattern.CASE_INSENSITIVE;
            Pattern pattern = Pattern.compile(patternStr, flags);
            matcher = pattern.matcher(str);

            int count = 0;
            while (matcher.find()) {
                list.add(matcher.group());
                count++;
            }
            System.out.println("날짜형태의 찾은 문자열 갯수(=list.length() 와 같음): " + count);
        }
        return list;
    }
	
}
