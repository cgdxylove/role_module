package org.show.user.util;

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

}