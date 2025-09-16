@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS ejemplo con introduccion de parametros'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCDS_PARAMETROS_EE18D
  with parameters
    pFromCurrencuy : abap.cuky,
    pToCurrency    : abap.cuky

  as select from /dmo/travel
{
  key travel_id                                              as TravelID,

      @Semantics.amount.currencyCode: 'OriginalCurrency'
      total_price                                            as OriginalPrice,
      currency_code                                          as OriginalCurrency,

      @Semantics.amount.currencyCode: 'ConvertedCurrency'
      currency_conversion( amount => total_price,
                           source_currency => $parameters.pFromCurrencuy,
                           target_currency => $parameters.pToCurrency,
                           exchange_rate_date => begin_date,
                           client => $session.client,
                           error_handling => 'SET_TO_NULL' ) as ConvertedPrice,
      $parameters.pToCurrency                                as ConvertedCurrency
}
where
  currency_code = $parameters.pFromCurrencuy;
