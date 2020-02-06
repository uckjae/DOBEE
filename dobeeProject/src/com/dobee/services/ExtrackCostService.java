package com.dobee.services;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
public class ExtrackCostService {


    public List<String> extractCost(String str) {
        List<String> list = new ArrayList<String>();
        Matcher matcher ;
        
        if (str.isEmpty()) {
            matcher = null;
        } else {
            String patternStr = "(^((-)?([1-9]([0-9]{0,2})?(,\\d{3})*|0)(\\.\\d+)?)$)"; 
            
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
