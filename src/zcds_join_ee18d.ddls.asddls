@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS para ejemplo de join'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCDS_JOIN_EE18D
  as select from /dmo/travel  as Travel
    inner join   /dmo/booking as Booking on Booking.travel_id = Travel.travel_id
{

  key Travel.travel_id      as TravelID,
  key Booking.booking_id    as BookingID,

      Booking.booking_date  as BookingDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Booking.flight_price  as FlightPrice,
      Booking.currency_code as CurrencyCode,

      Travel.agency_id      as AgencyId,
      Travel.begin_date     as BeginDate,
      Travel.end_date       as EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Travel.total_price    as TotalPrice



}
