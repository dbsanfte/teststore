//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Store.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Order
    {
        public Order()
        {
            this.OrderLineItems = new HashSet<OrderLineItem>();
        }
    
        public System.Guid Id { get; set; }
        public System.Guid CustomerId { get; set; }
        public System.DateTime Date { get; set; }
        public Nullable<System.Guid> PaypalInvoiceId { get; set; }
        public Nullable<int> ShippingMethod { get; set; }
        public Nullable<decimal> ShippingTotal { get; set; }
        public Nullable<decimal> HSTTotal { get; set; }
        public Nullable<decimal> OrderTotal { get; set; }
    
        public virtual ICollection<OrderLineItem> OrderLineItems { get; set; }
    }
}
