class DBHelper {
  static const String DATABASE_NAME = "sfd_db";
  static const String TABLE_PKT_REPORTS = "pkt_reports";
  static const String COLUMN_PKT_ID = "_id";
  static const String COLUMN_PKT_VIN = "vin";
  static const String COLUMN_PKT_PHOTO = "photo";
  static const String COLUMN_PKT_PHOTO_SALESMAN_AND_CUSTOMER = "photo_salesman_and_customer";
  static const String COLUMN_PKT_PHOTO_SERVICE_BOOK = "photo_service_book";
  static const String COLUMN_PKT_PHOTO_MY_MITSUBISHI = "photo_my_mitsubishi";
  static const String COLUMN_PKT_SALES_CODE = "sales_code";
  static const String COLUMN_PKT_SALES_NAME = "sales_name";
  static const String COLUMN_PKT_SALES_DEALER_NAME = "sales_dealer_name";
  static const String COLUMN_PKT_NOTE = "note";
  static const String COLUMN_PKT_TYPE = "type";
  static const String COLUMN_PKT_STATUS = "status";
  static const String COLUMN_PKT_VEHICLE_COLOR = "color";
  static const String COLUMN_PKT_VEHICLE_TYPE = "car_type";
  static const String COLUMN_PKT_CREATED_AT = "created_at";
  static const String COLUMN_PKT_UPDATED_AT = "updated_at";

  static const String CREATE_PKT_REPORTS_TABLE = "create table " +
      TABLE_PKT_REPORTS +
      "(" +
      COLUMN_PKT_ID +
      " integer primary key autoincrement, " +
      COLUMN_PKT_VIN +
      " text not null unique," +
      COLUMN_PKT_PHOTO +
      " text not null," +
      COLUMN_PKT_PHOTO_SALESMAN_AND_CUSTOMER +
      " text," +
      COLUMN_PKT_PHOTO_SERVICE_BOOK +
      " text," +
      COLUMN_PKT_PHOTO_MY_MITSUBISHI +
      " text," +
      COLUMN_PKT_SALES_CODE +
      " text," +
      COLUMN_PKT_SALES_NAME +
      " text," +
      COLUMN_PKT_SALES_DEALER_NAME +
      " text," +
      COLUMN_PKT_NOTE +
      " text," +
      COLUMN_PKT_TYPE +
      " text," +
      COLUMN_PKT_STATUS +
      " string," +
      COLUMN_PKT_VEHICLE_COLOR +
      " text," +
      COLUMN_PKT_VEHICLE_TYPE +
      " text," +
      COLUMN_PKT_CREATED_AT +
      " text," +
      COLUMN_PKT_UPDATED_AT +
      " text" +
      ");";
}
