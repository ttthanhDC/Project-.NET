using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataObject
{
    public class LuuChuyenDongTien
    {
        public int ID { set; get; }
        public int MaNganHangChi { set; get; }
        public Decimal SoTien { set; get; }
        public DateTime Ngay { set; get; }
        public DateTime NgayTao { set; get; }
        public string NguoiTao { set; get; }
        public int MaNganHangThu { set; get; }
        public string GhiChu { set; get; }
        public int IdKeToan { set; get; }
    }
}
