@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cds para las uniones'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCDS_UNION_EE18D
  as select from /dmo/travel
{
  key travel_id                  as TravelID,
      cast('' as abap.numc( 4 )) as BookingID
}

union select from /dmo/booking
{
  key travel_id  as TravelID,
      booking_id as BookingID
}
