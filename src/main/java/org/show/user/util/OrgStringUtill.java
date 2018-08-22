package org.show.user.util;

import java.util.List;
import java.util.Map;

public class OrgStringUtill {

    public static Boolean isNull(String org){
        if(org == null)
            return true ;
        else
            return false ;
    }

    public static Boolean isEmpty(String org){
        if(org == null||"".equals(org))
            return true ;
        else
            return false ;
    }



    public static Boolean isEmptyAbsolute(String org){
        if(org == null||"".equals(org)||"null".equals(org))
            return true ;
        else
            return false ;
    }

    public static Boolean isEmpty(Object obj){
        if(obj == null)
            return true ;
        else if ("".equals(obj.toString()))
            return true ;
        else if (obj instanceof List && ((List) obj).size()==0)
            return true;
        else if(obj instanceof Map && ((Map) obj).size()==0)
            return true ;
        else
            return  false ;
    }
}