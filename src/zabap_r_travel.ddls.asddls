@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data model for Travel App'
define root view entity zabap_R_Travel as select from ztabap_travel
 association [0..1] to /DMO/R_AgencyTP          as _Agency        on $projection.AgencyId = _Agency.AgencyID
  association [0..*] to /DMO/ZZ_I_Agency_Review  as _AgencyReview  on $projection.AgencyId = _AgencyReview.AgencyId
  association [0..1] to /DMO/I_Customer          as _Customer      on $projection.CustomerId = _Customer.CustomerID
  association [1..1] to /DMO/I_Overall_Status_VH as _OverallStatus on $projection.OverallStatus = _OverallStatus.OverallStatus
  association [0..1] to I_Currency               as _Currency      on $projection.CurrencyCode = _Currency.Currency
{

  key    travel_id                                as TravelId,
         agency_id                                as AgencyId,
         avg( _AgencyReview.Rating as abap.fltp ) as AgencyRating,
         customer_id                              as CustomerId,
         begin_date                               as BeginDate,
         end_date                                 as EndDate,
         @Semantics.amount.currencyCode: 'CurrencyCode'
         booking_fee                              as BookingFee,
         @Semantics.amount.currencyCode: 'CurrencyCode'
         total_price                              as TotalPrice,
         currency_code                            as CurrencyCode,
         description                              as Description,
         overall_status                           as OverallStatus,
         @Semantics.user.createdBy: true
         local_created_by                         as LocalCreatedBy,
         @Semantics.systemDateTime.createdAt: true
         local_created_at                         as LocalCreatedAt,
         @Semantics.user.lastChangedBy: true
         local_last_changed_by                    as LocalLastChangedBy,
         @Semantics.systemDateTime.localInstanceLastChangedAt: true
         local_last_changed_at                    as LocalLastChangedAt,

         @Semantics.systemDateTime.lastChangedAt: true
         last_changed_at                          as LastChangedAt,

         /* Associations */
         /* Associations */
      _Agency,
      _AgencyReview,
      _Customer,
      _OverallStatus,
      _Currency
}
group by
  travel_id,
  agency_id,
  customer_id,
  begin_date,
  end_date,
  booking_fee,
  total_price,
  currency_code,
  description,
  overall_status,
  local_created_by,
  local_created_at,
  local_last_changed_by,
  local_last_changed_at,
  last_changed_at
