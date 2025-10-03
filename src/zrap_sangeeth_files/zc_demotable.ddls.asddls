@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'DEmo'
@Metadata.ignorePropagatedAnnotations: true
@UI.headerInfo: { typeName: 'Invoice',
                  typeNamePlural: 'Invoices',
                  title: { type: #STANDARD, value: 'Uniquecode' },
                  description: { type: #STANDARD, value: 'Uniquecode' } }
@UI.presentationVariant: [ { sortOrder: [ { by: 'Uniquecode', direction: #ASC } ],
                             visualizations: [ { type: #AS_LINEITEM } ] } ]

define root view entity ZC_DEMOTABLE
  provider contract transactional_query
  as projection on ZR_DEMOTABLE

{
      @UI.facet: [ { label: 'General Information', id: 'GeneralInfo', type: #COLLECTION, position: 10 },
                   { id: 'Invoicedet',
                     purpose: #STANDARD,
                     type: #IDENTIFICATION_REFERENCE,
                     label: 'Invoice Details',
                     parentId: 'GeneralInfo',
                     position: 10 },
                   { id: 'Upload',
                     purpose: #STANDARD,
                     type: #FIELDGROUP_REFERENCE,
                     parentId: 'GeneralInfo',
                     label: 'Upload Invoice',
                     position: 20,
                     targetQualifier: 'Upload' } ]
      @UI.identification: [ { position: 10, label: 'Unique code' } ]
      @UI.lineItem: [ { position: 10, importance: #HIGH, label: 'Unique code' } ]
  key Uniquecode,

      @UI.identification: [ { position: 20, label: 'Comments' } ]
      @UI.lineItem: [ { position: 20, importance: #HIGH, label: 'Comments' } ]
      Comments,

      @Semantics.largeObject: { mimeType: 'Mimetype', fileName: 'Filename', contentDispositionPreference: #INLINE }
      @UI.fieldGroup: [ { position: 50, qualifier: 'Upload', label: 'Attachment' } ]
      Attachment,

      @Semantics.mimeType: true
      @UI.hidden: true
      MimeType,

      @UI.hidden: true
      Filename,

      LocalCreatedBy,
      LocalCreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt
}
