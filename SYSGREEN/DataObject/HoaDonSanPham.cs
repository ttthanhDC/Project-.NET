using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataObject
{
    public class HoaDonSanPham
    {
        public int ID  {set; get;}
	    public int IDNgayHoaDon  {set; get;}
	    public string product  {set; get;}
	    public int sugar {set; get;}
	    public int quantity {set; get;}
        public Decimal price { set; get; }
        public Decimal money { set; get; }
	    public string promotionCode {set; get;}
        public Decimal total { set; get; }
	    public string GhiChu {set; get;}
    }
}
