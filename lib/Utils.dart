import 'dart:collection';

class Utils {

   Map<String, String> getStates(){
    Map<String, String> states = new HashMap<String, String>();
    states.putIfAbsent("Alabama", () => "AL");
    states.putIfAbsent("Alaska", () => "AK");
    states.putIfAbsent("Alberta", () => "AB");
    states.putIfAbsent("American Samoa", () => "AS");
    states.putIfAbsent("Arizona", () => "AZ");
    states.putIfAbsent("Arkansas", () => "AR");
    states.putIfAbsent("Armed Forces (AE)", () => "AE");
    states.putIfAbsent("Armed Forces Americas", () => "AA");
    states.putIfAbsent("Armed Forces Pacific", () => "AP");
    states.putIfAbsent("British Columbia", () => "BC");
    states.putIfAbsent("California", () => "CA");
    states.putIfAbsent("Colorado", () => "CO");
    states.putIfAbsent("Connecticut", () => "CT");
    states.putIfAbsent("Delaware", () => "DE");
    states.putIfAbsent("District Of Columbia", () => "DC");
    states.putIfAbsent("Florida", () => "FL");
    states.putIfAbsent("Georgia", () => "GA");
    states.putIfAbsent("Guam", () => "GU");
    states.putIfAbsent("Hawaii", () => "HI");
    states.putIfAbsent("Idaho", () => "ID");
    states.putIfAbsent("Illinois", () => "IL");
    states.putIfAbsent("Indiana", () => "IN");
    states.putIfAbsent("Iowa", () => "IA");
    states.putIfAbsent("Kansas", () => "KS");
    states.putIfAbsent("Kentucky", () => "KY");
    states.putIfAbsent("Louisiana", () => "LA");
    states.putIfAbsent("Maine", () => "ME");
    states.putIfAbsent("Manitoba", () => "MB");
    states.putIfAbsent("Maryland", () => "MD");
    states.putIfAbsent("Massachusetts", () => "MA");
    states.putIfAbsent("Michigan", () => "MI");
    states.putIfAbsent("Minnesota", () => "MN");
    states.putIfAbsent("Mississippi", () => "MS");
    states.putIfAbsent("Missouri", () => "MO");
    states.putIfAbsent("Montana", () => "MT");
    states.putIfAbsent("Nebraska", () => "NE");
    states.putIfAbsent("Nevada", () => "NV");
    states.putIfAbsent("New Hampshire", () => "NH");
    states.putIfAbsent("New Jersey", () => "NJ");
    states.putIfAbsent("New Mexico", () => "NM");
    states.putIfAbsent("New York", () => "NY");
    states.putIfAbsent("Newfoundland", () => "NF");
    states.putIfAbsent("North Carolina", () => "NC");
    states.putIfAbsent("North Dakota", () => "ND");
    states.putIfAbsent("Northwest Territories", () => "NT");
    states.putIfAbsent("Nova Scotia", () => "NS");
    states.putIfAbsent("Nunavut", () => "NU");
    states.putIfAbsent("Ohio", () => "OH");
    states.putIfAbsent("Oklahoma", () => "OK");
    states.putIfAbsent("Ontario", () => "ON");
    states.putIfAbsent("Oregon", () => "OR");
    states.putIfAbsent("Pennsylvania", () => "PA");
    states.putIfAbsent("Prince Edward Island", () => "PE");
    states.putIfAbsent("Puerto Rico", () => "PR");
    states.putIfAbsent("Rhode Island", () => "RI");
    states.putIfAbsent("Saskatchewan", () => "SK");
    states.putIfAbsent("South Carolina", () => "SC");
    states.putIfAbsent("South Dakota", () => "SD");
    states.putIfAbsent("Tennessee", () => "TN");
    states.putIfAbsent("Texas", () => "TX");
    states.putIfAbsent("Utah", () => "UT");
    states.putIfAbsent("Vermont", () => "VT");
    states.putIfAbsent("Virgin Islands", () => "VI");
    states.putIfAbsent("Virginia", () => "VA");
    states.putIfAbsent("Washington", () => "WA");
    states.putIfAbsent("West Virginia", () => "WV");
    states.putIfAbsent("Wisconsin", () => "WI");
    states.putIfAbsent("Wyoming", () => "WY");
    states.putIfAbsent("Yukon Territory", () => "YT");

    return states;
  }

   String getParty(String party){
    String res = '';

    if(party == 'D'){
     res = 'Democrat';
    }else if(party == 'R'){
     res = 'Republican';
    }else{
     res = 'Independant';
    }
    return res;
   }
}