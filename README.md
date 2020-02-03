*Guidelines*
All Endpoints return JSON data
All endpoints are exposed under an api and v1 namespace
All JSON is compliant with the JSON API documentation.
Unit Prices are stored as floats and have two decimal places

*URL Conventions*
  URLs use resources for all restful API endpoints

  Custom URLs such as api/v1/merchants/revenue are namespaced under the appropriate
  resource with the url and restful controller action.

*API Resources*
  Each resource has an index, show, find, find_all, and random api endpoint. They
  also may have certain relationship and business logic endpoints under their namespace.

*Resources:*
Merchant
Customer
Item
Invoice
InvoiceItem
Transaction

*Single Finders*
Return a single resource and the endpoint will work with any of the attributes defined on the data type.

*Multi-Finders*
Returns all matches for the given query. It will work with any of the attributes defined on the data type.

*Random*
Returns a random resource.
