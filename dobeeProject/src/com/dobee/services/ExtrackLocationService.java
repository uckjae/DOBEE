package com.dobee.services;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
public class ExtrackLocationService {

	
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
    public List<String> extractLocation(String str) {

        List<String> list = new ArrayList<String>();
        
        Matcher matcher ;
        
        if (str.isEmpty()) {
            matcher = null;
        } else {
            String patternStr = "((([가-힣]+(\\d{1,5}|\\d{1,5}(,|.)\\d{1,5}|)+(읍|면|동|가|리))(^구|)((\\d{1,5}(~|-)\\d{1,5}|\\d{1,5})(가|리|)|))([ ](산(\\d{1,5}(~|-)\\d{1,5}|\\d{1,5}))|)|\r\n" + 
            		"    (([가-힣]|(\\d{1,5}(~|-)\\d{1,5})|\\d{1,5})+(로|길)))";
            	// 날자를 패턴으로 지정
            
            int flags = Pattern.MULTILINE | Pattern.CASE_INSENSITIVE;
            Pattern pattern = Pattern.compile(patternStr, flags);
            matcher = pattern.matcher(str);

            int count = 0;
            while (matcher.find()) {
                list.add(matcher.group());
                count++;
            }
        }

        return list;
    }
	
	
	
}
