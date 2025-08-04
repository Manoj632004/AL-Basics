// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

namespace DefaultPublisher.SPRINT03;

using Microsoft.Sales.Customer;

enum 50199 "Won/Lost Status"
{
    Extensible = false;

    value(0; "In Progress")
    {;
    }
    value(1; won)
    {

    }
    value(2; lost)
    {

    }
}