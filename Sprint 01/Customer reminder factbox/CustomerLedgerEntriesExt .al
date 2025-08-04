// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

namespace DefaultPublisher.Sprint01;

using Microsoft.Sales.Customer;
using Microsoft.Sales.Receivables;

pageextension 50161 "Customer Ledger Entries Ext" extends "Customer Ledger Entries"
{

    layout
    {
        addfirst(factboxes)
        {
            part(CutomerRemindersFactbox; "Customer Reminder Factbox")
            {
                SubPageLink = "Customer Entry No." = field("Entry No.");

                ApplicationArea = All;

            }
        }

    }
}