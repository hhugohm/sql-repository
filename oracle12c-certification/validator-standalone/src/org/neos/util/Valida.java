package org.neos.util;

public class Valida {

	public static void main(String[] args) {
		String email="hhugohm@hotmail.com";
		String email2="carlos_hernandez@level3.com";
		String name= "HectorHugo Hidalgo";
		String name2= "Hect";
		String rol="ADMIN ROLES";
		
		System.out.println(maskString(email,'*',MaskType.EMAIL));
		System.out.println(maskString(email2,'*',MaskType.EMAIL));
		System.out.println(maskString(name,'*',MaskType.CAPITAL_LETTER));
		System.out.println(maskString(name2,'*',MaskType.CAPITAL_LETTER));
		System.out.println(maskString(rol,'*',MaskType.OTHER_DATA));
	
		
		
		

	}

	
	   private static String maskString(String data, char mask, MaskType type) {
		    StringBuilder maskedString = new StringBuilder();
		   
		    if(data==null){
		    	maskedString.append("").toString();
		    }else{ 
		    	switch(type){
		    	case CAPITAL_LETTER:{
		    		if(data.length()>4){
		    			data= data.substring(0,4);
		    			maskedString = applyRulesMask(data,mask,MaskType.CAPITAL_LETTER);
		    		}else{
		    			maskedString = applyRulesMask(data,mask,MaskType.CAPITAL_LETTER);
		    		}
		 			
		 			break;
		    	}
		    	
		    	case EMAIL:{
		 			data = "abcd" + data.substring(data.indexOf('@'), data.length());
		 			maskedString = applyRulesMask(data,mask,MaskType.EMAIL);
		 			break;
		    	}
		    	case OTHER_DATA :{
		    		if(data.length()>6){
		    			data= data.substring(0,6);
		    			maskedString = applyRulesMask(data,mask,MaskType.OTHER_DATA);
		    		}else{
		    			maskedString = applyRulesMask(data,mask,MaskType.OTHER_DATA);
		    		}
		 			
		 			break;
		    	}
				default:
					if(data.length()>6){
		    			data= data.substring(0,6);
		    			maskedString = applyRulesMask(data,mask,MaskType.OTHER_DATA);
		    		}else{
		    			maskedString = applyRulesMask(data,mask,MaskType.OTHER_DATA);
		    		}
		 			
		 			break;
		    	
		    	}
		    	
		    }

		    	
		    return maskedString.toString();
		}
	   
	   
	   private static StringBuilder applyRulesMask(String data,char mask,MaskType type){
		   System.out.println("CADENA: " + data);
		   StringBuilder maskedString = new StringBuilder();
	    	for (int i = 0; i < data.length(); i++) {
	    		char character = ' ';
	    		character = data.charAt(i);
	    	
	    		if(type==MaskType.EMAIL){
	    			if(character == '@'){
	    				maskedString.append(data.substring(i, data.length()));
	    				break;
	    			}
	        		else{
	        			maskedString.append(mask);
	        			continue;
	        		}
	    		}
	    		if(type==MaskType.CAPITAL_LETTER){
	    			if(i == 0){
	    				maskedString.append(data.charAt(i));
	    				continue;
	    			}
	        		else{
	        			maskedString.append(mask);
	        			continue;
	        		}
	    		}
	    		if(type==MaskType.OTHER_DATA){
	        		maskedString.append(mask);
	        		continue;
	    		}
	    	} 
	    	
	    
	    return maskedString;
		   
	   }
}
