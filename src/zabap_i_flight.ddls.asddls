/* Create By : CB9980007091  Create On : Jun 19, 2024 */
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo Flight'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #B,
    sizeCategory: #S,
    dataClass: #MIXED
}


@UI.chart: [{
               qualifier: 'LineChart',
              chartType:         #BULLET ,
              measures:          ['SeatsOccupied'],
              measureAttributes: [{
                    measure:     'SeatsOccupied' ,
                    role:        #AXIS_1 ,
                    asDataPoint: true
                    }]
              }]

@Search.searchable: true
define view entity ZABAP_I_Flight
  as select from /dmo/flight
  association [1] to ZABAP_I_Carrier as _Ariline on $projection.CarrierId = _Ariline.CarrierId
{
      @UI.lineItem: [{ position: 10 }]
      @ObjectModel.text.association: '_Ariline'
  key carrier_id     as CarrierId,
      @UI.lineItem: [{ position: 20 }]
  key connection_id  as ConnectionId,
      @UI.lineItem: [{ position: 30 }]
  key flight_date    as FlightDate,
      @UI.lineItem: [{ position: 40 }]
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price          as Price,
      @UI.lineItem: [{ position: 50 }]
      currency_code  as CurrencyCode,
      @UI.lineItem: [{ position: 60 }]
      @Search: {
          defaultSearchElement: true,
          ranking: #MEDIUM,
          fuzzinessThreshold: 0.7

      }
      plane_type_id  as PlaneTypeId,
//      @UI.lineItem: [{ position: 70 }]
      seats_max      as SeatsMax,

      @UI:{ lineItem: [{ position: 100 ,
                   type: #AS_CHART,
                   label: 'Seats Occupied Level',
                   valueQualifier: 'LineChart'   }]
      }
      @UI.dataPoint: { title: 'Seats Occupied' ,
                         targetValueElement: 'SeatsMax' ,
                         criticalityCalculation: {
          improvementDirection: #MAXIMIZE,
          toleranceRangeLowValue: 75,
          deviationRangeLowValue: 50
      }
                       }
//@UI:{ lineItem: [{ position: 100 ,
//                   type: #AS_DATAPOINT,
//                   label: 'Seats Occupied Level' }]
//      }
// @UI.dataPoint: { visualization: #PROGRESS ,
//                   targetValueElement: 'SeatsMax' }

      seats_occupied as SeatsOccupied,
      /*Association*/
      _Ariline
}
