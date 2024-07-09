@EndUserText.label: 'Travel Projection View'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity zabap_c_travel 
provider contract transactional_query as projection on zabap_R_Travel
{
     @Search.defaultSearchElement: true
  key     TravelId,
          @Search.defaultSearchElement: true
          @ObjectModel.text.element: ['AgencyName']
          AgencyId,
          _Agency.Name              as AgencyName,
          AgencyRating,
          @Search.defaultSearchElement: true
          @ObjectModel.text.element: ['CustomerName']
          CustomerId,
          _Customer.LastName        as CustomerName,

          BeginDate,
          EndDate,

          BookingFee,
          TotalPrice,
          CurrencyCode,

          Description,

          @ObjectModel.text.element: ['OverallStatusText']
          OverallStatus,
          _OverallStatus._Text.Text as OverallStatusText : localized,

          LocalLastChangedAt,

          _Agency,
          _AgencyReview,
          _Currency,
          _Customer,
          _OverallStatus
}
