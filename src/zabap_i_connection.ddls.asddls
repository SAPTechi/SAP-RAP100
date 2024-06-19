/* Create By : CB9980007091  Create On : Jun 19, 2024 */
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo Connection'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #B,
    sizeCategory: #S,
    dataClass: #MIXED
}
@UI.headerInfo: {
    typeName: 'Connection',
    typeNamePlural: 'Connections'
}

@Search.searchable: true
define view entity ZABAP_I_Connection
  as select from /dmo/connection

  association [1..*] to ZABAP_I_Flight  as _Flight  on  $projection.CarrierId    = _Flight.CarrierId
                                                    and $projection.ConnectionId = _Flight.ConnectionId
  association [1]    to ZABAP_I_Carrier as _Carrier on  $projection.CarrierId = _Carrier.CarrierId
{

      @UI.facet: [{

          id: 'Connection',
          purpose: #STANDARD,
          position: 10,
          importance: #HIGH ,
          label: 'Connection Details',
          type: #IDENTIFICATION_REFERENCE
      },

      {id: 'Flight',
      purpose: #STANDARD,
      type: #LINEITEM_REFERENCE,
      position: 10,
      label: 'Flight Details',
      targetElement: '_Flight'

      }
      ]

      @UI.lineItem: [{ position: 10, label: 'Ariline' }]
      @UI.identification: [{ position: 10 , label: 'Ariline'}]
      @ObjectModel.text.association: '_Carrier'
      @Search: {
          defaultSearchElement: true,
          ranking: #MEDIUM,
          fuzzinessThreshold: 0.7
      }
  key carrier_id      as CarrierId,

      @UI.lineItem: [{ position: 20 }]
      @UI.identification: [{ position: 20 }]
  key connection_id   as ConnectionId,

      @UI.lineItem: [{ position: 30 }]
      @UI.identification: [{ position: 30 }]
      @Search: {
          defaultSearchElement: true,
          ranking: #MEDIUM,
          fuzzinessThreshold: 0.7

      }
      @UI.selectionField: [{ position: 10 }]
      airport_from_id as AirportFromId,

      @UI.lineItem: [{ position: 40 }]
      @UI.identification: [{ position: 40 }]
      @Search: {
          defaultSearchElement: true,
          ranking: #MEDIUM,
          fuzzinessThreshold: 0.7

      }
      @Consumption.valueHelpDefinition: [{ entity: {
          name: 'zabap_I_Airport_VH',
          element: 'AirportId'
      }  }]
      @UI.selectionField: [{ position: 20 }]
      airport_to_id   as AirportToId,

      @UI.lineItem: [{ position: 50, label: 'Depa Time' }]
      @UI.identification: [{ position: 50 }]
      departure_time  as DepartureTime,

      @UI.lineItem: [{ position: 60 , label: 'Arri Time'}]
      @UI.identification: [{ position: 60 }]
      arrival_time    as ArrivalTime,

      @UI.lineItem: [{ position: 70 }]
      @UI.identification: [{ position: 70 }]
      distance        as Distance,
      distance_unit   as DistanceUnit,

      /*Association */
      @Search.defaultSearchElement: true
      _Flight,
      @Search.defaultSearchElement: true
      _Carrier
}
