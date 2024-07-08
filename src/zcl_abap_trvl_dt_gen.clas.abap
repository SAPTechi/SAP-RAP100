CLASS zcl_abap_trvl_dt_gen DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_abap_trvl_dt_gen IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    SELECT FROM /dmo/travel
      FIELDS client,
             travel_id,
             agency_id,
             customer_id,
             begin_date,
             end_date,
             booking_fee,
             total_price,
             currency_code,
             description,
             status        AS overall_status,
             createdby     AS local_created_by,
             createdat     AS local_created_at,
             lastchangedby AS local_last_changed_by,
             lastchangedat AS local_last_changed_at,
             lastchangedat AS        last_changed_at
      INTO TABLE @DATA(travel_data).
    DELETE FROM ztabap_travel.
    INSERT ztabap_travel FROM TABLE @travel_data.
    out->write( 'Travel data generation completed' ) ##NO_TEXT.
  ENDMETHOD.
ENDCLASS.
