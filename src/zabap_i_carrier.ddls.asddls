/* Create By : CB9980007091  Create On : Jun 19, 2024 */
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo Carrier'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #B,
    sizeCategory: #S,
    dataClass: #MIXED
}

@Search.searchable: true
define view entity ZABAP_I_Carrier
  as select from /dmo/carrier
{
  key carrier_id            as CarrierId,
      @Search: {
            defaultSearchElement: true,
            ranking: #MEDIUM,
            fuzzinessThreshold: 0.7

        }
      @Semantics.text: true
      name                  as Name,
      currency_code         as CurrencyCode,
      local_created_by      as LocalCreatedBy,
      local_created_at      as LocalCreatedAt,
      local_last_changed_by as LocalLastChangedBy,
      local_last_changed_at as LocalLastChangedAt,
      last_changed_at       as LastChangedAt
}
