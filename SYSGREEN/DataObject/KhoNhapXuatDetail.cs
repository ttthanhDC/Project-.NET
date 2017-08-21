using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataObject
{
    public class KhoNhapXuatDetail
    {
        public int ID { set; get; }
        public int Type { set; get; }
        public int NhapKhoId { set; get; }
        public int XuatKhoId  { set; get; }
        public string Product_Code { set; get; }
        public string Product_Name { set; get; }
        public int SoLuong { set; get; }
        public int DonVi { set; get; }
        public DateTime HanSuDung { set; get; }
        public string Gia { set; get; }
        public int Kho { set; get; }
    }
}
