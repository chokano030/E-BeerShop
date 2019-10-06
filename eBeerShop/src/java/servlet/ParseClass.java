package servlet;
public class ParseClass {
    public boolean tryParseInt(String value) {  
     try {  
         Integer.parseInt(value);  
         return true;  
      } catch (NumberFormatException e) {  
         return false;  
      }  
    }
    public boolean tryParseFloat(String value) {  
     try {  
         Float.parseFloat(value);  
         return true;  
      } catch (NumberFormatException e) {  
         return false;  
      }  
    }
    public boolean tryParseLong(String value) {  
     try {  
         Long.parseLong(value);  
         return true;  
      } catch (NumberFormatException e) {  
         return false;  
      }  
    }
}
