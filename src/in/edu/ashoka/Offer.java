

/**
 * Created by manisha.sah on 06-05-2016.
 */
package in.edu.ashoka;
import com.mongodb.*;
import java.lang.*;

public class Offer{

    /** The method will store the inputs from offerer and add on the list of offered rides.*/

    public static void submit (String offerer,String phnNumber,String travelDate,String destination,String deptTime,
                               String numOfSeats,String charged,String description)
    {
        MongoClient User = new MongoClient();
        DB db = User.getDB("user");
        DBCollection rides = db.getCollection("rides");

        BasicDBObject info = new BasicDBObject();
        info.put("Name", offerer);
        info.put("PhoneNumber", phnNumber);
        info.put("Travelling Date",travelDate);
        info.put("Destination", destination);
        info.put("Departure time", deptTime);
        info.put("Maximum number of riders", numOfSeats);
        info.put("Charged", charged);
        info.put("Description",description);

        rides.insert(info);

    }

}

