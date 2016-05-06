package in.edu.ashoka;
import com.mongodb.*;
import java.lang.*;

/**
 * Created by manisha.sah on 06-05-2016.
 */
public class Rider {
    public static int searchRides (String travelDate,String destination,String numOfSeatsRequested)
    {
        int count=0;

        MongoClient User = new MongoClient();
        DB db = User.getDB("users");
        DBCollection rides = db.getCollection("rides");

        BasicDBObject searchQuery= new BasicDBObject();
        searchQuery.put("Travelling Date",travelDate);
        searchQuery.put("Destination",destination.toLowerCase());
        searchQuery.put("Maximum number of riders",new BasicDBObject("$gte",numOfSeatsRequested));

        DBCursor cursor = rides.find(searchQuery);
        DBObject rideInfo;

        while(cursor.hasNext())
        {
            rideInfo = cursor.next();
            String offerer = rideInfo.get("Name").toString();
            String phoneNumber = rideInfo.get("PhoneNumber").toString();
            String numOfSeats = rideInfo.get("Maximum number of riders").toString();
            String deptTime = rideInfo.get("Departure time").toString();
            String description = rideInfo.get("Description").toString();
            String riderId = rideInfo.get("_id").toString();

            //searchedRides (offerer, phoneNumber, numOfSeats, deptTime, description, riderId);



            /*System.out.print(info1+"  "+info2+"  "+info3+ " "+info4);
            System.out.println();
            System.out.print(info5);
            System.out.println();*/
            count++;
        }

        return count;


    }


    //static class Rides {
    //String offerer, phoneNumber, numOfSeats, deptTime, description, riderId;
       /* public static void searchedRides(String name, String phone,String seats,String time,String describe, String id)
        {
            String offerer = name;
            String phoneNumber = phone;
            String numOfSeats = seats;
            String deptTime = time;
            String description = describe;
            String riderId = id;

        }
    }

    /** The method confirm will accept the select ride and update the list of offered rides.*/

}
